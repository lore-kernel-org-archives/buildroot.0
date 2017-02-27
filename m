From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 27 Feb 2017 09:31:50 -0300 (BRT)
Subject: [Buildroot] [PATCH v7] gtest/gmock: bump to version 1.8.0
In-Reply-To: <20170226150525.359a21cf@free-electrons.com>
References: <1487070316-12583-1-git-send-email-casantos@datacom.ind.br>
 <1487784452-7424-1-git-send-email-casantos@datacom.ind.br>
 <20170226150525.359a21cf@free-electrons.com>
Message-ID: <802529421.12331306.1488198710194.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[resending, since Zimbra failed to deliver my last message]

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "Fabrice Fontaine" <fabrice.fontaine@orange.com>, "Romain Naour" <romain.naour@gmail.com>,
> "Yann E. MORIN" <yann.morin.1998@free.fr>
> Sent: Sunday, February 26, 2017 11:05:25 AM
> Subject: Re: [Buildroot] [PATCH v7] gtest/gmock: bump to version 1.8.0

> Hello,
> 
> Thanks for this new version, but there's still one thing (the same
> thing as before) that I don't understand.
> 
> On Wed, 22 Feb 2017 14:27:32 -0300, Carlos Santos wrote:
>> +# GTest's CMakeLists.txt uses a tricky logic:
>> +# - by default sets BUILD_GMOCK to ON and BUILD_GTEST to OFF
>> +# - if BUILD_GMOCK is ON then builds gmock, which in its turn builds gtest,
>> +#   regardless the value of BUILD_GTEST
>> +# - otherwise, if BUILD_GTEST is ON then build gtest, only
>> +# So, to build only gtest we must set BUILD_GTEST to ON and BUILD_GMOCK to OFF
>> +# to revert the default values. Setting both to ON is not really necessary but
>> +# describes clearly what we intend to do.
> 
> Knowing this, why don't you simply do the much more obvious:
> 
> GTEST_CONF_OPTS += -DBUILD_GTEST=ON
> 
> ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
> else
> GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
> endif
> 
> instead of the very cryptic!
> 
>> +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),)
>> +GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
>> +GTEST_CONF_OPTS += -DBUILD_GTEST=ON
>> +endif

Because it does not work (try http://patchwork.ozlabs.org/patch/727786/).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
