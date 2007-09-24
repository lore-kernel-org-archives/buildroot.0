From: Adam Hawes <adam@infocab.com.au>
Date: Tue, 25 Sep 2007 09:01:04 +0930
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <20070924132226.GC1335@aon.at>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
	<d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
	<1190600185.4299.44.camel@cyclops.infocab.com.au>
	<d6cda7730709232043k2d85bb2bi8318ef6f652a1eff@mail.gmail.com>
	<1190606113.22869.5.camel@cyclops.infocab.com.au>
	<20070924081339.GA31515@aon.at>
	<d6cda7730709240559nb93d524wcab63f2ee4e6c13a@mail.gmail.com>
	<20070924132226.GC1335@aon.at>
Message-ID: <1190676664.22869.8.camel@cyclops.infocab.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> >   According to Adam, this is required by mplayer (yeah, they are
> >broken, shame on them). I don't see why mplayer and qtopia and
> >possibly other packages should be mutually exclusive. Unless one\

I spent some time last night looking into mplayer.  It seems that it's
only broken in one place.  I made a quick hack to fix it (#define
index(a,b) ... in the file that was broken and tried compiling it
against a uClibc without the legacy macros.  It builds and runs fine on
my target.

I will submit a patch later to BR and MPlayer.

I haven't gone any further finding other packages that are broken - i
only built mplayer last night.

Regards,
A
