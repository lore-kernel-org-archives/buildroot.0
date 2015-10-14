From: Alan Ott <alan@softiron.co.uk>
Date: Wed, 14 Oct 2015 18:00:44 -0400
Subject: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD
In-Reply-To: <20151014235522.774491e2@free-electrons.com>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>	<1444859483-2268-5-git-send-email-alan@softiron.co.uk>
 <20151014235522.774491e2@free-electrons.com>
Message-ID: <561ED08C.5010301@softiron.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/2015 05:55 PM, Thomas Petazzoni wrote:
> On Wed, 14 Oct 2015 17:51:22 -0400, Alan Ott wrote:
>
>> +# The above revision must remain the same as the gmock package
>> +GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
>>   GTEST_INSTALL_STAGING = YES
>>   GTEST_INSTALL_TARGET = NO
>>   GTEST_LICENSE = BSD-3c
>>   GTEST_LICENSE_FILES = LICENSE
>> +GTEST_SUBDIR = googletest
> So gtest and gmock are in fact now part of the same repository/upstream
> project ? If that's the case, then I think we should simply get rid of
> the gtest and gmock packages, and have a single package named
> "googletest".

Yes, that would probably be better. gmock depends on gtest, and gtest 
can be standalone. Maybe we have one package with a submenu option to 
build each target (and a dependency so gmock selects gtest).

Is that ok by you?

Alan.
