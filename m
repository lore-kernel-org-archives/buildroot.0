From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 17:26:29 +0100
Subject: [Buildroot] [PATCH 2/2] package/ibrdtnd: include cstring
In-Reply-To: <1549375652-41472-2-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 5 Feb 2019 08:07:32 -0600")
References: <1549375652-41472-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1549375652-41472-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <878syumcay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Failure output
 >  SecurityCertificateManager.lo
 >  SecurityCertificateManager.cpp: In static member function 'static void dtn::security::SecurityCertificateManager::validateSubject(X509*, const string&)':
 >  SecurityCertificateManager.cpp:208:53: error: 'memcmp' was not declared in this scope
 >         if(memcmp(utf8_eid, utf8_cert_name, utf8_eid_len) == 0){

 > Upstream
 > https://github.com/ibrdtn/ibrdtn/commit/122fa8ed49f896abf6a389505f3d0b66d49d1e77

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Unsure why this failure came up as part of my testing for
 > http://autobuild.buildroot.net/results/385/3852a414afacbe3c044b1e49be8ccf8c554c8565
 > That build failure was using GCC4.8 and this fix was for GCC8.2+

Committed, thanks.

-- 
Bye, Peter Korsgaard
