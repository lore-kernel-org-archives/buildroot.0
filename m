From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 20:25:17 +0100
Subject: [Buildroot] [PATCH 8/8] utils/check-package: warn about
 overridden variables
In-Reply-To: <20190127185943.1136-9-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Jan 2019 16:59:43 -0200")
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-9-ricardo.martincoski@gmail.com>
Message-ID: <87a7jakpgi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > For the general case, appending values to variables is OK and also a
 > good practice, like this:
 > |PACKAGE_VAR = value1
 > |ifeq ...
 > |PACKAGE_VAR += value2

 > or this, when the above is not possible:
 > |PACKAGE_VAR = value1
 > |ifeq ...
 > |PACKAGE_VAR := $(PACKAGE_VAR), value2

 > But this override is an error:
 > |PACKAGE_VAR = value1
 > |PACKAGE_VAR = value2

 > as well this one:
 > |ifeq ...
 > |PACKAGE_VAR += value1
 > |endif
 > |PACKAGE_VAR = value2

 > And this override is error-prone:
 > |PACKAGE_VAR = value1
 > |ifeq ...
 > |PACKAGE_VAR = value2

 > Create a check function to warn about overridden variables.

 > Some variables are likely to have a default value that gets overridden
 > in a conditional, so ignore them. The name of such variables end in
 > _ARCH, _CPU, _SITE, _SOURCE or _VERSION.

 > After ignoring these variable names, there are a few exceptions to this
 > rule in the tree. For them use the comment that disables the check.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Simon Dawson <spdawson@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
