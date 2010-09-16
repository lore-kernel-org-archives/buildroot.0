From: Mitch Davis <mjd+buildroot@afork.com>
Date: Thu, 16 Sep 2010 20:14:59 +1000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <SNT119-W38CBF8166B7F1ADD41EB29827A0@phx.gbl>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>
	<20100913102031.03481d63@surf>
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>
	<87mxrm6lrc.fsf@macbook.be.48ers.dk>
	<SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>
	<20100915133124.604f8b74@surf>
	<SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>
	<20100915190725.459aaca8@surf>
	<SNT119-W315E2AFFA66E576AA7F27A827A0@phx.gbl>
	<1284627065.4173.2221.camel@station1.ormlab.com>
	<SNT119-W38B5142DB23D37AEB445A827A0@phx.gbl>
	<AANLkTinbDS1nrt4b6TgctMwHArtwrX7_JSrzbeqxWCn=@mail.gmail.com>
	<SNT119-W38CBF8166B7F1ADD41EB29827A0@phx.gbl>
Message-ID: <AANLkTikJG-f3PPiTjqEiSyPN=aU9HFNvuAnOZY91ADbL@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 16, 2010 at 8:11 PM, Johnny Beardsmore <jny0@hotmail.com> wrote:
>
>> I'm quite puzzled how GRUB can run a shell script...
>
> I do it like this:
>
> title Installation Procedure
> #root (hd1,0)
> kernel /boot/bzImage root=/dev/sda1 panic=5 slowusb rootdelay=10
> init=/home/reflash.sh

I see the connection now, but if it helps your comprehension, GRUB is
long gone by the time the script starts.  Grub loads the kernel and
passes control, then the kernel mounts /dev/sda1, then calls
/home/reflash.sh.

M.
