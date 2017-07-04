From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 14:22:24 +0200
Subject: [Buildroot] libasan.so missing
In-Reply-To: <ed1251ca-9f4a-6f7c-3b51-7cc399299574@grandegger.com> (Wolfgang
 Grandegger's message of "Tue, 4 Jul 2017 12:16:18 +0200")
References: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
 <877ezp780a.fsf@dell.be.48ers.dk>
 <3af3ceda-f9fb-ff4c-c203-2248fade16d2@grandegger.com>
 <87podh5gi7.fsf@dell.be.48ers.dk>
 <ed1251ca-9f4a-6f7c-3b51-7cc399299574@grandegger.com>
Message-ID: <87shic2xz3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:

Hi,

 >> Correct. I've sent a patch fixing this for the internal and external
 >> toolchain. Could you give it a try?
 >> 
 >> https://patchwork.ozlabs.org/patch/783661/
 >> https://patchwork.ozlabs.org/patch/783660/

 > $ find . -name 'libasan*'
 > ./target/lib/libasan.so
 > ./target/lib/libasan_preinit.o
 > ./target/lib/libasan.so.2
 > ./target/lib/libasan.so.2.0.0

 > It works. The libsanitizer adds some extra space and runtime overhead,
 > I assume. Therefore, on Ubuntu, the libraries are not installed by
 > default. They can be added by installing the "libasan0" package. For
 > buildroot, would it make sense to make this option configurable as
 > well?

 > (libasan.*) Extra toolchain libraries to be copied to target

Yes, I'll respin the series to add an option to install
asan/lsan/tsan/usan.

-- 
Bye, Peter Korsgaard
