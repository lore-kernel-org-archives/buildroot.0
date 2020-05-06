From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:46:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: fix build with poppler and
 gcc 5
In-Reply-To: <20200404213245.1519848-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 4 Apr 2020 23:32:45 +0200")
References: <20200404213245.1519848-1-fontaine.fabrice@gmail.com>
Message-ID: <87pnbhd39o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > -std=c++11 is needed to avoid the following build failure with poppler
 > and gcc 5:

 > /home/naourr/work/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:40:37: note: C++11 'noexcept' only available with -std=c++11 or -std=gnu++11
 > /home/naourr/work/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:70:10: error: 'unique_ptr' in namespace 'std' does not name a template type
 >      std::unique_ptr<text_box_data> m_data;
 >           ^
 > Fixes:
 >  - http://autobuild.buildroot.org/results/3428b9017168db9239756dc06cdaa5ae004cab97

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

I initially worried if older gcc versions (efl only requires 4.7+)
support the -std=c++11 option, but according to the release notes it was
added in 4.7:

https://gcc.gnu.org/gcc-4.7/changes.html

-- 
Bye, Peter Korsgaard
