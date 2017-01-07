From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 7 Jan 2017 20:16:38 +0200
Subject: [Buildroot] [PATCH 1/1] pure-ftpd: Added pure-ftpd quotas
 config option
In-Reply-To: <CAKGmAFp1JP3RCR2=08QHOig1yOAo64X3Ww6Ns19m1sAV0O39Gg@mail.gmail.com>
References: <1483641714-6962-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <20170105184933.wnnfmvcpmlaubypc@sapphire.tkos.co.il>
 <CAKGmAFp1JP3RCR2=08QHOig1yOAo64X3Ww6Ns19m1sAV0O39Gg@mail.gmail.com>
Message-ID: <20170107181638.7eqglup24a3pkktv@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bryce,

On Fri, Jan 06, 2017 at 08:49:43AM -0600, Bryce Ferguson wrote:
> On Thu, Jan 5, 2017 at 12:49 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Thu, Jan 05, 2017 at 12:41:54PM -0600, Bryce Ferguson wrote:
> >> +config BR2_PACKAGE_PURE_FTPD_QUOTAS
> >> +     bool "quotas"
> >> +     help
> >> +       Enable virtual quotas. With virtual quotas, restrictions can be placed
> >> +       on the maximum number of files a user can store in his account.  In
> >> +       addition, restrictions can also be placed on the total size.
> >
> > What is the impact of this feature on executable size? In case the impact is
> > small compared to the size of pure-ftpd itself, the general preference in
> > Buildroot is to just enable the feature unconditionally.
> 
> I did a build test, one with the feature and one without.  When this
> feature is enabled, the executable size increases by a little over
> 20%.  Hope that helps, thanks for the feedback.

This size increase is worth an additional config option, IMO. Please put this 
information in the commit log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
