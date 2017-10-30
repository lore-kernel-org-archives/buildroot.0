From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Oct 2017 16:46:18 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libssh2: Add selectable
 crypto libraries
In-Reply-To: <CAH=K+6m_PJy-kk8TkTgfgL=UpqXeYhKYs5Czaje2yjdSTg1w0w@mail.gmail.com>
References: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
 <20171030051949.n2w5iprgp6cv5zg2@sapphire.tkos.co.il>
 <CAH=K+6m_PJy-kk8TkTgfgL=UpqXeYhKYs5Czaje2yjdSTg1w0w@mail.gmail.com>
Message-ID: <20171030144618.ljxx6wgujtq4nnfn@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Mon, Oct 30, 2017 at 09:27:17AM -0500, Sam Voss wrote:
> On Mon, Oct 30, 2017 at 12:19 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> [...]
> > Have you tested combination of options after the version bump in the next
> > patch?
> 
> Could you elaborate on this? I don't understand what you mean by
> combination of options.

When you have for example both openssl and mbedtls enabled, the 
--with-[backend] options will no longer work after the version bump. So the 
crypto backend selection logic will have no effect, so you might end up with 
the wrong backend being used.

When testing these patches try enabling multiple crypto packages, and make 
sure that only the backend you selected for libssh2 is the one that is 
actually used.

> > The master libssh2 branch changes the configure crypto selection options to
> > --with-crypto=auto|openssl|libgcrypt|mbedtls. You should either take this into
> > account in the version bump patch, or (preferably, IMO) reverse the patches
> > order, change to --with-crypto in the version bump patch, and add selectable
> > crypto backend in the second.
> 
> Good catch, I didn't catch this in the diffs. I will look into these options.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
