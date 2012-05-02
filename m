From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 May 2012 08:25:26 +0300
Subject: [Buildroot] Enabling debugging symbols in packages..
In-Reply-To: <CAC2kKA_L9EZt+WWW6Dn4uX2+V_Bj7JxLEYY605pS8GhXDbw3Ag@mail.gmail.com>
References: <CAC2kKA8s_8d=u2BDz4Ai0GA_QEru6+76dY3=0_3=s75jjK=QxA@mail.gmail.com>
 <20120502041303.GA31267@sapphire.tkos.co.il>
 <CAC2kKA_L9EZt+WWW6Dn4uX2+V_Bj7JxLEYY605pS8GhXDbw3Ag@mail.gmail.com>
Message-ID: <20120502052526.GC31267@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Shawn,

On Tue, May 01, 2012 at 11:13:50PM -0600, Shawn Ferris wrote:
> > Target binaries get striped after build, thus removing debugging info. To
> > disabled this behaviour go to "Build options" -> "strip command for binaries
> > on target", and select "none".
> 
> Doh! That was it indeed.. is there a reason this isn't disabled
> automatically when debugging is enabled? Not that it matters now that
> I know it's there, just curious :D

Debugging is useful even when the target binaries are striped.  Quoting the 
help text of BR2_ENABLE_DEBUG:

          Build packages with debugging symbols enabled. All libraries
          and binaries in the 'staging' directory will have debugging
          symbols, which allows remote debugging even if libraries and
          binaries are stripped on the target. Whether libraries and
          binaries are stripped on the target is controlled by the
          BR2_STRIP_* options below.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
