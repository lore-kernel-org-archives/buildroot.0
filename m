From: Andreas Ehmanns <universeii@gmx.de>
Date: Thu, 10 Dec 2015 20:03:46 +0100
Subject: [Buildroot] Move openldap package and enable LDAP server?
In-Reply-To: <56614CF8.5050804@gmx.de>
References: <56614B18.4030703@gmx.de>
 <20151204091924.2f5f9c22@free-electrons.com> <56614CF8.5050804@gmx.de>
Message-ID: <5669CC92.8080504@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 04.12.2015 um 09:21 schrieb Andreas Ehmanns:
> Am 04.12.2015 um 09:19 schrieb Thomas Petazzoni:
>> Hello,
>>
>> On Fri, 4 Dec 2015 09:13:12 +0100, Andreas Ehmanns wrote:
>>
>>> I was going to use openLDAP on my embedded device and found the
>>> configuration under Target Packages -> Libraries -> Networking.
>>> You can enable openldap which only generates the ldap libraries but 
>>> have
>>> an option to let the client applications being built.
>>> Since I need the LDAP server I added an option to compile the LDAP
>>> server too. Everything works fine and I thought about submitting the
>>> patch but then I asked me if the configuration location is still the
>>> right place.
>>> Wouldn't it be better to place the openldap configuration under
>>> Target Packages -> Networking Applications
>>> instead of
>>> Target Packages -> Libraries -> Networking
>>>
>>> What is your opinion?
>> Yes, I agree that it probably makes more sense to have OpenLDAP in
>> Networking Applications, even if it indeed also provides a client
>> library.
>>
>> Thomas
> O.k., I will prepare/propose a patch for adding the ldap server option 
> and moving the configuration to Networking Applications.
>
> Regards,
> Andreas

Thomas,
please find attached the patch for adding the openldap server. It 
contains the server option, moves the configuration to "Networking 
Applications" and adds an init script for the ldap server.

Please let me know what you think about the patch and if there are 
things that I should change.

Regards,
Andreas

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-Added-server-to-openldap-package-and-changed-package.patch
Type: text/x-patch
Size: 4722 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151210/939c16b9/attachment.bin>
