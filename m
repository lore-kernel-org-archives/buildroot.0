From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Mon, 10 Nov 2014 16:16:09 +0100
Subject: [Buildroot] [PATCH] inetutils: new package
In-Reply-To: <CABbD_XBJzp-ibX5bMB_SfxndbPQs_R5+gqTaPrwAWJFmz5Nj5A@mail.gmail.com>
References: <1414624048-37143-1-git-send-email-kaszak@gmail.com>
 <852735167.27218624.1414655605361.JavaMail.root@openwide.fr>
 <CABbD_XB2q_Vqn0cyJgHjeCPtLUrbC=rt7=VxLJhNwkX819Lu_A@mail.gmail.com>
 <20141030094018.GH1759@tarshish>
 <CABbD_XDXmwU5QgT0i=g=zs_13fBWPdv2Bn+WfFZMDU_YX8er+Q@mail.gmail.com>
 <20141030125801.GO1759@tarshish>
 <CABbD_XDu4yyqHX=0JbMg-4WpLivg7K41X62F6+BMtPT6NVS-dA@mail.gmail.com>
 <CABbD_XDjRYVSW4zLZhcOKD1asx8YMOk3+=L+d7teEr9cDhu1-A@mail.gmail.com>
 <20141101200125.509c0b89@free-electrons.com>
 <CABbD_XA35CzC9nWkUnXnidJFEnZ0=yV1wd1f8FytjPKunw=uQg@mail.gmail.com>
 <20141101213117.6673aa69@free-electrons.com>
 <CABbD_XBJzp-ibX5bMB_SfxndbPQs_R5+gqTaPrwAWJFmz5Nj5A@mail.gmail.com>
Message-ID: <CABbD_XBV+rRKDPk1PwXmRa2Nw8RWGMG1zLAoAFGCovGpaJQd7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

any comment on this one?
Shall I send the v2 with the redundant utilities disabled?

Best regards,
Karoly

On Sun, Nov 2, 2014 at 1:45 PM, K?roly Kasza <kaszak@gmail.com> wrote:

> Hi,
>
> I wrote a small script to analyse which files are redundant, and if they
> will be overwritten or not.
> I ran it against busybox, net-tools, iputils, rsh-redone, sysklogd and
> whois because I found that these
> packages may overlap with inetutils' tools.
>
> The same filename lines mean that an other file with the same name, but
> with a different path exists
> (the compared package's path is in the brackets).
> The same path lines mean that it would be overwritten at install.
>
> busybox:
> Found same filename /usr/bin/dnsdomainname (/bin/dnsdomainname)
> Found same filename /usr/bin/ping (/bin/ping)
> Found same filename /usr/bin/hostname (/bin/hostname)
> Found same filename /usr/bin/ifconfig (/sbin/ifconfig)
> Found same filename /usr/libexec/syslogd (/sbin/syslogd)
> Found same path /usr/bin/traceroute
> Found same path /usr/bin/tftp
> Found same path /usr/bin/logger
> Found same path /usr/bin/telnet
> Found same filename /usr/libexec/inetd (/usr/sbin/inetd)
>
> net-tools:
> Found same filename /usr/bin/dnsdomainname (/bin/dnsdomainname)
> Found same filename /usr/bin/hostname (/bin/hostname)
> Found same filename /usr/bin/ifconfig (/sbin/ifconfig)
> Found same path /usr/share/man/man1/dnsdomainname.1
> Found same path /usr/share/man/man1/hostname.1
>
> iputils:
> Found same filename /usr/bin/ping6 (/bin/ping6)
> Found same filename /usr/bin/ping (/bin/ping)
>
> rsh-redone:
> Found same path /usr/bin/rlogin
> Found same path /usr/bin/rsh
>
> sysklogd:
> Found same filename /usr/libexec/syslogd (/sbin/syslogd)
>
> whois:
> Found same path /usr/share/man/man1/whois.1
> Found same path /usr/bin/whois
>
> I think a solution would be to disable inetutils' redundant tools:
> whois, sysklogd, rlogin(d), rsh(d), ping, ping6, hostname, dnsdomainname,
> ifconfig, hostname.
>
> After that, the only utility, that's not overwritten would be inetd from
> busybox, where a post-install hook
> could simply alter the busybox symlink to point to inetutils' version
> instead.
>
> I'm waiting for your opinions!
>
> Best regards,
> Karoly
>
> On Sat, Nov 1, 2014 at 9:31 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Dear K?roly Kasza,
>>
>> On Sat, 1 Nov 2014 20:07:25 +0100, K?roly Kasza wrote:
>>
>> > it is unpleasant indeed.
>> > What is the Buildroot recommended method for these issues?
>> > Should I modify the install target to overwrite the existing tools?
>>
>> I'd say it depends on the cases. Can you do a summary of the situation,
>> i.e what tools inetutils installs and where, and how it compares with
>> the installation location of the same tools by Busybox? That might help
>> see how far we are, and what is the appropriate course of action.
>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
>
> --
>
> ?dv,
> KK
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141110/298ac24d/attachment.html>
