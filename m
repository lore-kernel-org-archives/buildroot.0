From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 8 Sep 2016 17:34:01 -0300 (BRT)
Subject: [Buildroot] [PATCH] gmock: download from github and convert to
 a cmake-package
In-Reply-To: <20160908221432.405ce5e1@free-electrons.com>
References: <983781693.3690991.1473290568772.JavaMail.zimbra@datacom.ind.br>
 <1473353883-10762-1-git-send-email-casantos@datacom.ind.br>
 <20160908212033.1d1c6947@free-electrons.com>
 <893091325.3899936.1473365508575.JavaMail.zimbra@datacom.ind.br>
 <20160908221432.405ce5e1@free-electrons.com>
Message-ID: <139799423.3904364.1473366841281.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "fabrice fontaine" <fabrice.fontaine@orange.com>, "fontaine fabrice" <fontaine.fabrice@gmail.com>,
> buildroot at buildroot.org
> Sent: Thursday, September 8, 2016 5:14:32 PM
> Subject: Re: [Buildroot] [PATCH] gmock: download from github and convert to a cmake-package

> Hello,
> 
> On Thu, 8 Sep 2016 17:11:48 -0300 (BRT), Carlos Santos wrote:
> 
>> > Why is it the case? As far as I'm aware, it's not currently the case
>> > with the existing packaging.
>> 
>> Because the old gmock distribution (gmock-1.7.0.zip) contained the gtest
>> code, while the new one (gmock-release-1.7.0.tar.gz) does not.
> 
> If the old gmock distribution contained the gtest code, why do we have
> two separate packages for gmock and gtest ?

In the beginning there was gtest, only. We (DATACOM) added gmock last
year, due to the need to support more than a hundred packages in which
we use it to run unit tests.

> In any case, I guess this is a transitional solution, since the final
> goal is to have a single package, right ?

Yes, I think that starting in gtest v. 1.8.0 it will be possible to get
rid of the separated packages.

Carlos Santos (Casantos)
DATACOM, P&D
