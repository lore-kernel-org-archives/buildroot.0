From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 16:19:19 +0100
Subject: [Buildroot] [PATCH v7 3/4] infra: Introduce BR2_HOST_NEEDS_JAVA
In-Reply-To: <1392680233-24585-4-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Tue, 18 Feb 2014 00:37:12 +0100")
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392680233-24585-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87vbwbyvt4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > XBMC needs Java on the host in order to build, because it  uses a
 > code-generator which is build in two phases:
 > In the first phase SWIG is used to parse C++ header files that define the API.
 > SWIG outputs an XML file that contains a complete description of the structure
 > of the API.
 > In the second phase, the XML file is ingested by a Groovy (Java) program that
 > then creates C++ code that forms the bridge to the scripting language (Python).

 > The second phase is why we need java on the host.

 > You can learn more at the XBMC's wiki:
 > http://wiki.xbmc.org/index.php?title=Codegeneration#How_it_works

 > In order to check that, this patch introduce this mechanism in
 > dependencies.sh
 > It also defines the variable in Config.in

The commit message is wrapped kind of strange.

 > +++ b/support/dependencies/dependencies.sh
 > @@ -191,6 +191,14 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG ; then
 >  	done
 >  fi
 
 > +if grep -q ^BR2_HOST_NEEDS_JAVA=y $BR2_CONFIG ; then
 > +	if ! which java > /dev/null ; then
 > +		echo >&2
 > +		echo "You must install '$prog' on your build machine" >&2

And it should use 'java' instead of '$prog' here.

Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
