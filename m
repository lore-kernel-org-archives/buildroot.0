From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 21 Apr 2017 15:17:28 +1200
Subject: [Buildroot] [PATCH] syslog-ng: use bundled libbson
In-Reply-To: <20170420221955.7bc076c8@free-electrons.com>
References: <cb65ed7b607b680814b733781dbb884fa78471f1.1492684628.git.baruch@tkos.co.il>
 <20170420221955.7bc076c8@free-electrons.com>
Message-ID: <CAFOYHZCCYj706p-EBjTBcqLjmG0R6qV9ZCWOqy_zfP8NsDgDCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 21, 2017 at 8:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 20 Apr 2017 13:37:08 +0300, Baruch Siach wrote:
>> libbson is a dependency of the mongo-c-driver that syslog-ng uses. Buildroot
>> doesn't package mongo-c-driver so syslog-ng uses the bundled one. The bundled
>> mongo-c-driver in turn may optionally use a bundled libbson. When Buildroot
>> builds libbson mongo-c-driver detects that and does not configure its bundled
>> libbson. This breaks the build of the syslog-ng mongodb module because it adds
>> the bundled libbson to the headers search path.
>>
>> Always use the mongo-c-driver bundled libbson. Anyone concerned with the size
>> impact should add a standalone mongo-c-driver to Buildroot.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/843/84331e9a168d8bdf2cceca8e9e1480611c1ecaed/
>> http://autobuild.buildroot.net/results/b5b/b5bad64abbf5764faf2a7129a1a25ad75c34980b/
>> http://autobuild.buildroot.net/results/3c3/3c32f4eb7436da06f3fb59f928363959df2a5e86/
>>
>> Cc: Chris Packham <judge.packham@gmail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  package/syslog-ng/syslog-ng.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Thanks for the patch. However, wouldn't it make more sense to disable
> the mongo-c-driver of syslog-ng completely, until someone packages the
> appropriate dependencies?
>

I'm fine with either approach.
