From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 4 Oct 2011 12:54:50 +0200
Subject: [Buildroot] How to create package that build with scons
In-Reply-To: <CANc=jjo0e1tvgSm2KTiFaxBd3pPW4zJs=pZ8HVsyFCYGhyLqnw@mail.gmail.com>
References: <CANc=jjo0e1tvgSm2KTiFaxBd3pPW4zJs=pZ8HVsyFCYGhyLqnw@mail.gmail.com>
Message-ID: <20111004105449.GB22823@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrew,

On Tue, Oct 04, 2011 at 01:34:56PM +0300, Andrew Pushkin wrote:
> Hello I need create package that build with scons (I need gpsd-3.0). How can
> I create it? May be some-were exists some documentation or examples to do
> it?

Use the GENTARGETS facility, and define your $(PKG)_BUILD_CMDS to run scons.  
You need to select HOST_SCONS for Buildroot to build it for you. See 
http://buildroot.uclibc.org/buildroot.html for details on the GENTARGETS 
facility. Note that the information there is somewhat outdated.

Now I see that the package/scons/scons.mk file (from commit cae6d239) is not 
referenced anywhere, so it looks broken currently. Thomas, can you comment on 
this?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
