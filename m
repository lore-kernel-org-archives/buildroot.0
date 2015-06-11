From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jun 2015 23:06:15 +0200
Subject: [Buildroot] [PATCH v3 1/3] atf: new package
In-Reply-To: <5579F2C9.6010107@savoirfairelinux.com>
References: <1433717727-30214-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<1433717727-30214-2-git-send-email-sebastien.bourdelin@savoirfairelinux.com>	<20150611223324.07b59100@free-electrons.com>
 <5579F2C9.6010107@savoirfairelinux.com>
Message-ID: <5579F847.5010103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/15 22:42, Sebastien Bourdelin wrote:
> Hi Thomas.
> 
> I will leave you that choice :)
> 
> Thanks.
> 
> On 06/11/2015 04:33 PM, Thomas Petazzoni wrote:
[snip]
>> It installs quite a bunch of things to the target filesystem, including
>> C and C++ source code, which seems a bit useless since we don't support
>> building/installing a compiler for the target:

 Sebastien, could you still respond to this question? AFAICS, Thomas is right,
these tests actually test atf itself so they shouldn't be installed, or they
should be cleaned up in a POST_TARGET_INSTALL_HOOK. I think the easiest is not
to install them, by setting

ATF_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec

 This installs only the libraries and the atf-sh program, which I think is all
that is needed.


 Regards,
 Arnout

>>
>> ./usr/tests/atf
>> ./usr/tests/atf/Kyuafile
>> ./usr/tests/atf/atf-sh
>> ./usr/tests/atf/atf-sh/tc_test
>> ./usr/tests/atf/atf-sh/Kyuafile
>> ./usr/tests/atf/atf-sh/atf-check_test
>> ./usr/tests/atf/atf-sh/tp_test
>> ./usr/tests/atf/atf-sh/integration_test
>> ./usr/tests/atf/atf-sh/misc_helpers
>> ./usr/tests/atf/atf-sh/normalize_test
>> ./usr/tests/atf/atf-sh/config_test
>> ./usr/tests/atf/atf-sh/atf_check_test
>> ./usr/tests/atf/atf-c
>> ./usr/tests/atf/atf-c/tc_test
>> ./usr/tests/atf/atf-c/Kyuafile
>> ./usr/tests/atf/atf-c/atf_c_test
>> ./usr/tests/atf/atf-c/macros_test
>> ./usr/tests/atf/atf-c/tp_test
>> ./usr/tests/atf/atf-c/build_test
>> ./usr/tests/atf/atf-c/error_test
>> ./usr/tests/atf/atf-c/check_test
>> ./usr/tests/atf/atf-c/utils_test
>> ./usr/tests/atf/atf-c/pkg_config_test
>> ./usr/tests/atf/atf-c/macros_h_test.c
>> ./usr/tests/atf/atf-c/unused_test.c
>> ./usr/tests/atf/atf-c/detail
>> ./usr/tests/atf/atf-c/detail/version_helper
>> ./usr/tests/atf/atf-c/detail/env_test
>> ./usr/tests/atf/atf-c/detail/Kyuafile
>> ./usr/tests/atf/atf-c/detail/process_test
>> ./usr/tests/atf/atf-c/detail/fs_test
>> ./usr/tests/atf/atf-c/detail/text_test
>> ./usr/tests/atf/atf-c/detail/dynstr_test
>> ./usr/tests/atf/atf-c/detail/sanity_test
>> ./usr/tests/atf/atf-c/detail/list_test
>> ./usr/tests/atf/atf-c/detail/user_test
>> ./usr/tests/atf/atf-c/detail/process_helpers
>> ./usr/tests/atf/atf-c/detail/map_test
>> ./usr/tests/atf/atf-c++
>> ./usr/tests/atf/atf-c++/atf_c++_test
>> ./usr/tests/atf/atf-c++/macros_hpp_test.cpp
>> ./usr/tests/atf/atf-c++/Kyuafile
>> ./usr/tests/atf/atf-c++/tests_test
>> ./usr/tests/atf/atf-c++/macros_test
>> ./usr/tests/atf/atf-c++/build_test
>> ./usr/tests/atf/atf-c++/check_test
>> ./usr/tests/atf/atf-c++/utils_test
>> ./usr/tests/atf/atf-c++/pkg_config_test
>> ./usr/tests/atf/atf-c++/unused_test.cpp
>> ./usr/tests/atf/atf-c++/detail
>> ./usr/tests/atf/atf-c++/detail/version_helper
>> ./usr/tests/atf/atf-c++/detail/env_test
>> ./usr/tests/atf/atf-c++/detail/Kyuafile
>> ./usr/tests/atf/atf-c++/detail/process_test
>> ./usr/tests/atf/atf-c++/detail/exceptions_test
>> ./usr/tests/atf/atf-c++/detail/fs_test
>> ./usr/tests/atf/atf-c++/detail/application_test
>> ./usr/tests/atf/atf-c++/detail/text_test
>> ./usr/tests/atf/atf-c++/detail/auto_array_test
>> ./usr/tests/atf/test-programs
>> ./usr/tests/atf/test-programs/srcdir_test
>> ./usr/tests/atf/test-programs/Kyuafile
>> ./usr/tests/atf/test-programs/c_helpers
>> ./usr/tests/atf/test-programs/sh_helpers
>> ./usr/tests/atf/test-programs/expect_test
>> ./usr/tests/atf/test-programs/config_test
>> ./usr/tests/atf/test-programs/meta_data_test
>> ./usr/tests/atf/test-programs/cpp_helpers
>> ./usr/tests/atf/test-programs/result_test
>>
>> Are all of these files needed on the target?
>>
>> Thanks,
>>
>> Thomas
> 
> 
>  
>  
> ************************************************************************************
> This footnote confirms that this email message has been scanned by
> PineApp Mail-SeCure for the presence of malicious code, vandals & computer viruses.
> ************************************************************************************
> 
> 
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
