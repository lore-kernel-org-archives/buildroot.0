From: Andreas Ehmanns <universeii@gmx.de>
Date: Sat, 12 Dec 2015 18:20:23 +0100
Subject: [Buildroot] Move openldap package and enable LDAP server?
In-Reply-To: <20151212140145.5a7583dc@free-electrons.com>
References: <56614B18.4030703@gmx.de>
 <20151204091924.2f5f9c22@free-electrons.com> <56614CF8.5050804@gmx.de>
 <5669CC92.8080504@gmx.de> <20151212140145.5a7583dc@free-electrons.com>
Message-ID: <566C5757.2050409@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am 12.12.2015 um 14:01 schrieb Thomas Petazzoni:
> Hello Andreas,
>
> On Thu, 10 Dec 2015 20:03:46 +0100, Andreas Ehmanns wrote:
>
>> please find attached the patch for adding the openldap server. It
>> contains the server option, moves the configuration to "Networking
>> Applications" and adds an init script for the ldap server.
>>
>> Please let me know what you think about the patch and if there are
>> things that I should change.
> Thanks. But could you please send the patch with 'git send-email'
> rather than as an attachment? It allows the patch to be reviewed
> properly, and also easily applied.
>
> A few comments though:
>
>   * The commit title is too long. Something like:
>
> 	openldap: add support to build the server
>
>     would be preferable.
>
>   * I think you should keep the "default y" on
>     BR2_PACKAGE_OPENLDAP_CLIENTS in order to preserve the existing
>     behavior, and not breaking things for current users.
>
>   * In the S75sldapd script, I believe checking for the presence of the
>     daemon and config file is not really needed.
>
>     If the -4 in ARGS is to force IPv4 only, I believe it's not really
>     great. Why not also support IPv6 ?
>
>   * There is a fix of tabs and spaces for the indentation in the shell
>     script, please try to be consistent.
>
>   * Please use "printf" rather than "echo -n" in the shell script, since
>     printf is POSIX, while "echo -n" is not.
>
>   * We normally use a PID file, see S50dropbear for example. Is slapd
>     already managing its own PID file ?
>
>   * In the .mk file, the OPENLDAP_USERS definition is inside a condition
>     that is commented out, it doesn't look good.
>
>   * Don't do ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),n), but just ifeq
>     ($(BR2_PACKAGE_OPENLDAP_SERVER),). An option will never have the
>     value 'n': when an option is disabled, its value is the empty string.
>
> Could you take those comments into account and send an updated version?
>
> Thanks a lot!
>
> Thomas
thanks for your comments. I will incorporate the changes next week and 
send a patch using git.

Regards,
Andreas
