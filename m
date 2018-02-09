From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 9 Feb 2018 10:04:37 +0100
Subject: [Buildroot] [next] listing of tests is broken
In-Reply-To: <20180209095441.287880e0@windsurf.lan>
References: <CAGm1_kvtXtxu_YjCeXNOUr706hJp-nwrX77QOD9m9B7e3t6ftg@mail.gmail.com>
 <20180209095441.287880e0@windsurf.lan>
Message-ID: <CAGm1_kuAEFhftNH4UsFUL0Cy-M_0PppKS0C6VdB9WWu+MGqgJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 9, 2018 at 9:54 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Fri, 9 Feb 2018 09:44:26 +0100, Yegor Yefremov wrote:
>> ./support/testing/run-tests -l
>>
>>   File "/home/user/br_test/support/testing/infra/basetest.py", line
>> 45, in __init__
>>     self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
>> TypeError: unsupported operand type(s) for +=: 'NoneType' and 'str'
>>
>> Any idea?
>
> Yes, it is a fallout from the Rust tests, one of the class has no
> "config" variable, which causes this breakage.
>
> I have not yet decided if the right fix is to replace config = None by
> config = list() in the base test class, or to fix the Rust test case.

I'm for the first fix: config = list()

Yegor
