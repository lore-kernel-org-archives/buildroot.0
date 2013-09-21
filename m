From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Sat, 21 Sep 2013 21:38:02 +0300
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.1.1
In-Reply-To: <20130919205514.53b092ff@skate>
References: <201309182118.23091.fatih.asici@gmail.com>
 <523B3759.1000901@mind.be> <20130919205514.53b092ff@skate>
Message-ID: <201309212138.02246.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Thursday 19 September 2013 21:55:14 Thomas Petazzoni wrote:
> On Thu, 19 Sep 2013 19:41:45 +0200, Arnout Vandecappelle wrote:
> >   Perhaps we could try upstreaming our mkspecs? Does that make sense?
> 
> Our mkspecs is really meant to be a template that has to be tuned by
> the qt5base.mk makefile, and therefore outside Buildroot itself I
> believe its meaning is not so important. We could even carry it within
> package/qt5/qt5base/ rather than as a patch, for example.

I think, this part could be simplified by using a mkspec file for "Generic 
Linux" device which could be accepted by upstream. In order to customize 
variables we can use -device-option argument. As you mention in a comment in 
qt5base.mk, this option has some problems. I sent[1] a patch to upstream which 
fixes a problem when the value contains an equal sign.

I am also waiting[2] for a reply from upstream about the linux-generic-g++ 
device suggestion.

I have tried this method on my local machine and it seems working.

[1] https://bugreports.qt-project.org/browse/QTBUG-33584
[2] https://bugreports.qt-project.org/browse/QTBUG-33586

---
Fatih
