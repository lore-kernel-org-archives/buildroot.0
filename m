From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 30 Oct 2014 14:58:01 +0200
Subject: [Buildroot] [PATCH] inetutils: new package
In-Reply-To: <CABbD_XDXmwU5QgT0i=g=zs_13fBWPdv2Bn+WfFZMDU_YX8er+Q@mail.gmail.com>
References: <1414624048-37143-1-git-send-email-kaszak@gmail.com>
 <852735167.27218624.1414655605361.JavaMail.root@openwide.fr>
 <CABbD_XB2q_Vqn0cyJgHjeCPtLUrbC=rt7=VxLJhNwkX819Lu_A@mail.gmail.com>
 <20141030094018.GH1759@tarshish>
 <CABbD_XDXmwU5QgT0i=g=zs_13fBWPdv2Bn+WfFZMDU_YX8er+Q@mail.gmail.com>
Message-ID: <20141030125801.GO1759@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi K?roly,

On Thu, Oct 30, 2014 at 10:50:00AM +0100, K?roly Kasza wrote:
> Buildroot handles these "race conditions" with the <package>_DEPENDENCIES
> variables.
> I added Busybox as one (if selected), so Inetutils will always win over
> Busybox (that is probably
> unnecessary btw, Busybox should always be built before other packages - but
> I'm not sure in cases, where
> Busybox is built, but not the default init system nor shell).
> The other packages who provide anything related to inetutils are not yet
> added, but of course they can be added
> to act as dependencies.
> The question is, why do anybody want to compile and use different
> implementations of one program? I mean what
> could be the use case?

You assume that the user is doing a deliberate choice when enabling net-tools 
or inetutils. This is often not the case. A user bringing up a networking 
device is very likely to enable both packages. The version that eventually 
lands in the target will now be determined by the build order, and that may 
change from one build to another. We generally want make build results as 
consistent as possible. So, at the very least, we should warn the user in a 
comment that depends on BR2_PACKAGE_NET_TOOLS. I'm not sure this is enough, 
though.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
