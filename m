From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Apr 2012 16:10:53 +0200
Subject: [Buildroot] Buildroot fails to build when selecting build
	packages
In-Reply-To: <CAG6aBkVmLoN-fHkGWUiOfjRM7k2swUvzNQ38p=schi+Y2Ug1hg@mail.gmail.com>
References: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
 <201204291144.26712.arnout@mind.be>
 <CAG6aBkVmLoN-fHkGWUiOfjRM7k2swUvzNQ38p=schi+Y2Ug1hg@mail.gmail.com>
Message-ID: <4F9D4BED.4050001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/12 15:27, Nigel Sollars wrote:
> Hello,
>
> I dont have either of those set for environment vars, ( went through
> profile / profile.d and env )
>
> here is the output:
>
> configure:28819: checking for DBUS1
> configure:28826: $PKG_CONFIG --exists --print-errors "dbus-1 >= 1.2.14"
> configure:28829: $? = 0
> configure:28842: $PKG_CONFIG --exists --print-errors "dbus-1 >= 1.2.14"
> configure:28845: $? = 0
> configure:28882: result: yes

  So pkg-config incorrectly claims that dbus is available.  Is there 
really a dbus-1.pc file in output/staging/usr/lib/pkgconfig?  Can you 
run "output/host/usr/bin/pkg-config --debug --modversion dbus-1" ?

  Regards,
  Arnout
