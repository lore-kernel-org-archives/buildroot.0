From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 00:59:18 +0200
Subject: [Buildroot] [PATCH next v3] ptpd2: fix ptpd2-ptp2 build failure
 due to EVP_MD_CTX conflict and U64 missing
In-Reply-To: <20180831224845.61264-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Sat, 1 Sep 2018 00:48:45 +0200")
References: <20180831224845.61264-1-giulio.benetti@micronovasrl.com>
Message-ID: <87efcgfewp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > In src/dep/ntpengine/ntp_isc_md5.* :
 > EVP_MD_CTX typedef conflicts with openssl same name typedef EVP_MD_CTX.
 > Referenced here:
 > https://github.com/ptpd/ptpd/issues/54
 > and here:
 > https://bugs.gentoo.org/664500

 > In src/dep/snmp.c :
 > U64 can be missing or conflicts with new perl as reported here:
 > https://github.com/ptpd/ptpd/issues/25
 > Use Ad Hoc patch since the one proposed on upstream [1] is too new and can't
 > be applied to current version(2.3.1)

 > Add 2 patches to package to:
 > - replace EVP_MD_CTX with PTPD_EVP_MD_CTX to avoid conflicts with openssl
 > - replace U64 with struct counter64 to avoid to miss it with certain
 > toolchains

 > Fixes:
 > http://autobuild.buildroot.net/results/47b/47b99a6de256bfc0f5a8ae1484bb34e93b407237//
 > http://autobuild.buildroot.net/results/083/08365fc559dda74640b9750358c82e84600a68ea//
 > http://autobuild.buildroot.net/results/9b4/9b41c513500c63a9890973a0f17ffdb84d44d580//
 > http://autobuild.buildroot.net/results/2ed/2ed79d01635c9a5e1018229dc6f4b7240a995b87//
 > http://autobuild.buildroot.net/results/6d1/6d1b7e191f573334115684b85165f2bc27d75d8f//
 > http://autobuild.buildroot.net/results/f54/f54c6fd841b3ea77dc12048c81f3f2991b679252//
 > http://autobuild.buildroot.net/results/332/332bc77bcde0bef1b2fd7b9993409dd051c27cd6//
 > http://autobuild.buildroot.net/results/4b4/4b416edaec9528d75a82c9570b8f8297718ca62d//

 > [1]: https://github.com/ptpd/ptpd/commit/99cbb146b6114fc5fd7b59a90ceb56c27e5ee700

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
