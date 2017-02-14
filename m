From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 15:51:47 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214142725.1b9e98ae@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 14 Feb 2017 14:27:25 +0100")
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
Message-ID: <87lgt8kepo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> arm |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/d9ab699ba314f87a12b4982811ebfa1c3186a408

 > CConfig.cpp: In member function 'CConfigReadContext::operator void*() const':
 > CConfig.cpp:1851:9: error: cannot convert 'std::istream {aka std::basic_istream<char>}' to 'void*' in return

 > Modern gcc issue ?

Yes, I believe so (this failures are with gcc 6.x). I had a quick look
yesterday, and our synergy package is ancient. It seems to have moved to
github and changed quite a bit since then.

https://github.com/symless/synergy/

The last release in the 1.3.x series is 1.3.8. I'll take a look and see
if that has fixed this issue.

-- 
Bye, Peter Korsgaard
