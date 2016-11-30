From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 29 Nov 2016 20:12:56 -0500
Subject: [Buildroot] [PATCH v2 3/3] pru-sample: add sample PRU
	application
In-Reply-To: <698688f1-7d97-fe08-0a47-ebd6e2c68761@mind.be>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
 <1a270629-34f9-06f6-fb58-25455e61900d@mind.be>
 <CAK8F28mHwYonzL1Wx052TXCzd3U4TjvfQiMPuqxuQmRBLv-2zg@mail.gmail.com>
 <20161127144731.18bd30cb@free-electrons.com>
 <CAK8F28mp6tU3oncTK5FpNqUU9o-z0fUOMOxoGYEw7yeRd9uJ5A@mail.gmail.com>
 <698688f1-7d97-fe08-0a47-ebd6e2c68761@mind.be>
Message-ID: <CAK8F28nmqTrS2ug6FvCg=vymG6e64dEFJAqHmtQ_k28mVnHpqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 29, 2016 at 6:41 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> Clearly, TI_CGT_PRU_INSTALLDIR is the equivalent of STAGING_DIR for the PRU. In
> that sense, it makes sense to have TI_CGT_PRU_INSTALLDIR as a subdirectory of
> HOST_DIR (just like STAGING_DIR is a subdirectory of HOST_DIR). And it anyway
> has to be a subdirectory of HOST_DIR because the compiler executables are
> installed there as well. For me, that was the reason to say that it should be a
> host package.
>
>  However, we are indeed building for the target (kind of). and we are installing
> into a staging directory (though it is not in STAGING_DIR). So it makes sense to
> make it a target package, with INSTALL_STAGING = YES, but where the
> INSTALL_STAGING step doesn't actually install in staging but in the 'PRU
> staging' i.e. TI_CGT_PRU_INSTALLDIR.

In either case, TI_CGT_PRU_INSTALLDIR is the right place for it to go
:). As we are obliged to cross-compile x86 --> PRU (so staging must be
on x86), perhaps this makes an argument for sticking with current (v3)
host package approach?

--Ash
