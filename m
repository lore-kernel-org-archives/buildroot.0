From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 09:31:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: boost-filesystem needs
 wchar
In-Reply-To: <1437635893.2784.4.camel@embedded.rocks>
References: <1437142516-12378-1-git-send-email-joerg.krause@embedded.rocks>
 <20150722085507.4f78d81f@free-electrons.com>
 <1437635893.2784.4.camel@embedded.rocks>
Message-ID: <20150723093109.38aa581e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 23 Jul 2015 09:18:13 +0200, J?rg Krause wrote:

> There are a lot more then five boost modules needing wchar. If we make
> boost depending on wchar we add reverse dependencies to some packages
> which could be build without wchar before.
> 
> What do you think?

 * cc-tool -> already depends on wchar
 * gnuradio -> already depends on wchar
 * kodi -> already depends on wchar
 * libftdi1 -> does not depend on wchar yet, but only the C++ bindings
   of libftdi1 need boost, so I think it's OK
 * mpd -> already depends on wchar
 * pulseview -> already depends on wchar
 * python-libconfig -> already depends on wchar since it depends on
   python or python3, and both depend on wchar
 * thrift -> already depends on wchar
 * yaml-cpp -> would add a wchar dependency
 * zmpqq -> already depends on wchar

So the only affected packages are the C++ bindings of libftdi1 and
yaml-cpp.

Conclusion: I believe it's reasonable to add a wchar dependency
globally to boost. It's a pain to keep track which sub-option of boost
needs or does not need wchar, and boost is a "big" thing, so having an
additional toolchain dependency that is nevertheless already very
common, is not a big issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
