From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Jan 2011 22:51:22 +0100
Subject: [Buildroot] [git commit master 1/1] Use sys-root rather than
	sysroot for the sysroot/staging_dir
In-Reply-To: <201101252239.36666.yann.morin.1998@anciens.enib.fr> (Yann
	E. MORIN's message of "Tue, 25 Jan 2011 22:39:36 +0100")
References: <20110125150944.2C7438D244@busybox.osuosl.org>
	<201101252239.36666.yann.morin.1998@anciens.enib.fr>
Message-ID: <87wrlszm79.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Peter, All,
 Yann> On Tuesday 25 January 2011 16:08:50 Peter Korsgaard wrote:
 >> The name of the sysroot directory is arbitrary, but as ct-ng uses sys-root,
 >> let's use that as well for consistency.

 Yann> As Thomas said on IRC, I would suggest to revert this. Is there
 Yann> anything in BR that depends on the sysroot being named 'sysroot'
 Yann> or 'sys-root' at all, or was that just an eye-candy change?
 Yann> (genuine question)

No, as mentioned - The name is arbitrary, but as the ct-ng version we're
currently using hardcodes it as sys-root, then we either need to use
sys-root or add symlinks if we want ct-ng to install directly into
HOST_DIR/usr to get BR's and ct-ng's idea of $tuple/sys-root to match.

 Yann> I will push the change in crosstool-NG that makes this
 Yann> configurable, and the default is now 'sysroot', instead of the
 Yann> old hard-coded 'sys-root'.

Ok, good.

 Yann> Then, it will be a matter of taste what to set it to, with BR forcing it
 Yann> to whatever suits (I believe just 'sysroot').

Yeah. Until very recently noone really cared as STAGING_DIR used to be
directly in output/.

 Yann> Also, note that not all toolchains set this to any of 'sysroot'
 Yann> or 'sys-root'.  For example, the CodeSourcery toolchains set this
 Yann> to 'libc' for the main sysroot, and to libc/${variant} for each
 Yann> supported variant's sysroot.

Yes, but that's OK. This change was just to get the ct-ng toolchain to
behave more similar to the internal one.

-- 
Bye, Peter Korsgaard
