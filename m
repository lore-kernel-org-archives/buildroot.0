From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 1 Sep 2012 13:45:38 +0200
Subject: [Buildroot] boost 1.51.0 bz2 archive observations
In-Reply-To: <5041F078.2080106@mind.be>
References: <CAJkQPO=_T94Y854wErurMiwrQyZFbW7Mt9+9ak0xGDU0ahiEaw@mail.gmail.com>
 <5041F078.2080106@mind.be>
Message-ID: <CAHXCMM+xCS8q40aEf50jrukDcsDkzDg7WQuWoOcgD7qRZ9-D3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/9/1 Arnout Vandecappelle <arnout@mind.be>:
> On 08/31/12 17:39, Aras Vaichas wrote:
>>
>> Sorry for the cross-posting, but I'm not sure where to put this.
>>
>> There is a slight difference between the 1.51.0 and 1.50.0 boost bz2
>> files.
>>
>> e.g.
>> \boost_1_50_0.tar.bz2\boost_1_50_0.tar\boost_1_50_0\
>> \boost_1_51_0.tar.bz2\boost_1_51_0.tar\.\boost_1_51_0\
>>
>> I went looking for this because I updated the Boost version to 1.51.0
>> in Buildroot and it failed to find the bootstrap.sh file because it
>> wasn't in the expected directory.
>
>
>  This happens because buildroot uses the --strip-components=1 option of
> tar to remove the leading path component - and now this is just the '.' that
> is removed.
>
>  If the boost maintainers could repackage the tar file without the leading
> .,
> that would be really nice for us.  If not, we have to construct a workaround
> in buildroot to treat the boost extraction specially. (Aras: you can
> probably
> just add "/boost_1_51_0" to all the references to $(@D) in the .mk file.)

Or just declare the boost  subdir in the .mk file:
BOOST_SUBDIR = boost_1_51_0


Cheers,

-- 
Sam
