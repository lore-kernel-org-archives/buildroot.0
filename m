From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Aug 2018 09:20:18 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: do not use static version of
 openssl
In-Reply-To: <CAPi7W80nTJSznQ6xwv9w7A4gEzhRPHfXBGHnQSY3qhCWinF2Cg@mail.gmail.com>
References: <20180829165312.22948-1-fontaine.fabrice@gmail.com>
 <20180829213941.2953f99a@windsurf>
 <CAPi7W80nTJSznQ6xwv9w7A4gEzhRPHfXBGHnQSY3qhCWinF2Cg@mail.gmail.com>
Message-ID: <20180830092018.22411518@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Aug 2018 23:26:52 +0200, Fabrice Fontaine wrote:

> > Hum. So I guess reading the wording of your commit message that you
> > didn't manage to reproduce the problem, nor verify that the patch was
> > fixing it ?
> >  
> Thats's right, I was not able to reproduce it.

I was able to reproduce it. You can do it using the br-reproduce-build
script [1]:

./br-reproduce-build 8e072a91ded61a3c2ae1f740f098d3ada274d52b

[1] https://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build

> > Looking at http://autobuild.buildroot.net/?reason=domoticz%, the
> > problem clearly started suddenly appearing on July 4th.
> >
> > The previous failure of domoticz was on March 1st, then no failures for
> > several months, and then suddenly on July 4th, we start to see this
> > failure, which was not seen before it seems.
> >
> > The "bump to version 4.9700" was committed on June 27. Is it possible
> > that it is the reason for the new build failure ? So it means this case
> > would not have been tested between June 27 and July 4 ? Possible.
> >  
> It shoud be noted that the USE_OPENSSL_STATIC option was added in 4.9700:
> https://github.com/domoticz/domoticz/commit/2ae1d315d16962ff1c22f539aa5ddc708b95241a.
> Before this version, openssl was not statically linked by default.
> 
> > I'm running right now a build of one specific build failure to see if I
> > can reproduce and get more details about what's going.
> >  
> Thanks for your help.

I was able to reproduce it with the command above, I'll see if I have
some time to investigate further, but if you do have some time, don't
hesitate to do so :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
