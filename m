From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 08:26:34 +0100
Subject: [Buildroot] [PATCH v4 1/2] qt: Script Module needs a toolchain
	with NPTL
In-Reply-To: <1416408006-30928-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 19 Nov 2014 14:40:05 +0000")
References: <1416408006-30928-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87ppc7n5ud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Qt Script Module uses pthread_getattr_np() which is implemented in
 > toolchains with NPTL. Otherwise the compilation will fail showing this
 > error message:

 > ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp: In
 > function ?void* QTJSC::currentThreadStackBase()?:
 > ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:692:42:
 > error: ?pthread_getattr_np? was not declared in this scope

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > Changes v3 -> v4
 
 > Propagate dependency to grantlee package

Committed, thanks.

-- 
Bye, Peter Korsgaard
