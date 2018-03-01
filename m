From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 2 Mar 2018 00:07:43 +0200
Subject: [Buildroot] pulseaudio isn't work on buildroot-2017.02.5
In-Reply-To: <1519913539.26930.5.camel@embedded.rocks>
References: <1503571325385-173857.post@n4.nabble.com>
 <20170824192644.56481029@windsurf>
 <1503640121686-173903.post@n4.nabble.com>
 <1519913539.26930.5.camel@embedded.rocks>
Message-ID: <20180301220743.vmhgrpj2kwt7bdmh@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Thu, Mar 01, 2018 at 03:12:19PM +0100, J?rg Krause wrote:
> On Thu, 2017-08-24 at 22:48 -0700, Jonas wrote:
> > thank you for your reply.
> > 
> > I try to set "BR2_PACKAGE_PULSEAUDIO_DAEMON".
> > 
> > # ps
> > ...
> >   223 root     -sh
> >   224 root     /sbin/getty -L tty1 0 vt100
> >   256 pulse    pulseaudio --system --daemonize
> >   260 root     ps
> > 
> > it seen works in system mode, but I want to use "pactl" command.
> > I need set source and sink.
> > 
> > I get this error message:
> > # pactl stat
> > Connection failure: Access denied
> > 
> > #pactl list sources short
> > Connection failure: Access denied
> > 
> > #pactl list sink short
> > Connection failure: Access denied
> > 
> > Could you help me again.
> > Thank you very much.
> 
> In case someone has the same issue. I got it working adding the root
> user to the pulse-access group:
> 
> # grep pulse-access /etc/group
> pulse-access:x:1006:pulse,root

Do you have any idea how this solves the permission issue?

> @Thomas: Is this something we need to address if
> BR2_PACKAGE_PULSEAUDIO_DAEMON is selected?

barauch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
