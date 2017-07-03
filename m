From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 00:50:20 +0200
Subject: [Buildroot] [RFC PATCH v5 00/11] Make the SDK relocatable
In-Reply-To: <1498811828-6893-1-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
Message-ID: <d20f9390-20ae-7021-1005-4afe8daeea7f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Wolfgang,

 Again thank you very much for sustaining the work on this series!

On 30-06-17 10:36, Wolfgang Grandegger wrote:
> Hello,
> 
> this is v5 of my patch series to make the buildroot SDK (HOST_DIR)
> relocatable. It sanitizes the RPATH of all ELF files in the "target",
> "staging" and "host" tree using "patchelf --make-rpath-relative". I
> have started the mainlining process to implement "--make-rpath-relative"
> using GitHub pull request [1]... till now, no answer!
> 
> In contrast to v4, this series now does RPATH sanitation per package
> after package installation into the host, staging or target tree
> using GLOBAL_INSTRUMENTATION_HOOKS, similar to "check-bin-arch" or
> "check-host-rpath". This is a first hack to demonstrate feasibility.
> The scripts in "pkg-generic.mk" needs some more polish to be more
> efficient and elegant. See also "Changes since v4" below.

 Samuel and I reviewed the entire series now. It's getting closer but I expect a
v7 will still be needed even after you send v6. I've marked these as Changes
Requested in patchwork.


> Furthermore this patch creates the script "relocate-sdk.sh" in the top
> directory of the "host" tree allowing to relocate the SDK after it has
> been moved to a new location. It replaces the old path with the new
> one in all text files identified by "file --mime-type". The location
> is stored in "usr/share/buildroot/sdk-location".

 These final patches are pretty much ready, just minor things. Peter will
probably fix them up tomorrow and commit directly. So if you start working on
those, please give us a ping first (preferably on IRC - Peter is Jacmet).


> Unfortunately, "qmake" uses hard-coded pathes compiled into the QT5
> libraries. To overcome this problem, "qt5pase" now creates "qt.conf".

 There will be many more packages that need this kind of treatment, I expect.
Things will hopefully improve over time.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
