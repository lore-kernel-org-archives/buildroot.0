From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Mar 2020 23:59:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/classpath: drop package
In-Reply-To: <20200302100146.74261-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 2 Mar 2020 03:01:46 -0700")
References: <20200302100146.74261-1-james.hilliard1@gmail.com>
Message-ID: <87tv35avu6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > This package has been abandoned by upstream since 2016 and has not
 > had a release since 2012. In addition the GNU Compiler for Java
 > that classpath was written to be used with has been removed as of
 > GCC 7.

 > It is no longer feasible to support classpath as it requires a java
 > compiler capable of producing java 1.5 compatible bytecode which is
 > not possible on hosts with a recent java compiler.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

 > -config BR2_PACKAGE_CLASSPATH
 > -	bool "classpath"
 > -	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
 > -	select BR2_NEEDS_HOST_JAR
 > -	select BR2_NEEDS_HOST_JAVAC

This was the only use of these symbols, so I've also removed them and
the corresponding logic.

-- 
Bye, Peter Korsgaard
