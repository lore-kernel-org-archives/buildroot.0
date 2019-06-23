From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 22:15:21 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/openjdk: set PATH before calling make
In-Reply-To: <20190610131453.12186-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 10 Jun 2019 15:14:53 +0200")
References: <20190610131453.12186-1-fontaine.fabrice@gmail.com>
Message-ID: <875zowcb3a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > PATH must be set to $(BR_PATH) thanks to $(TARGET_MAKE_ENV) before
 > calling make otherwise build fails on:
 > /bin/bash: gawk: command not found

 > When build fails, config.log contains the following line:

 > configure:13709: checking for gawk
 > configure:13725: found /home/buildroot/autobuild/run/instance-3/output/host/bin/gawk
 > configure:13736: result: gawk
 > [...]
 > ac_cv_prog_AWK=gawk

 > Fixes:
 >  - http://autobuild.buildroot.org/results/43c5d08f599e8f44b59a576d243ae1c7b27de7a3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Arnout Vandecappelle):
 >  - Set PATH thanks to $(TARGET_MAKE_ENV) instead of setting AWK

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
