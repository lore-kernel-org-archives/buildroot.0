From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 14 Oct 2018 19:07:10 -0300
Subject: [Buildroot] [PATCH 4/5] support/testing: add python-incremental
 tests
References: <20181011204641.6ded469a@windsurf>
Message-ID: <5bc3be0e5f649_79c83fc5c20195c4596a2@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Oct 11, 2018 at 03:46 PM, Thomas Petazzoni wrote:

> On Tue, 25 Sep 2018 23:55:13 -0300, Ricardo Martincoski wrote:
> 
>> +class TestPythonIncremental(TestPythonBase):
>> +    def str_test(self):
>> +        cmd = self.interpreter + " -c 'import incremental;"
>> +        cmd += "v = incremental.Version(\"package\", 1, 2, 3, release_candidate=4);"
>> +        cmd += "assert(str(v) == \"[package, version 1.2.3rc4]\")'"
> 
> When I see this, I wonder if it wouldn't be nicer to do something like
> this:
> 
> class PythonIncremental(TestPythonBase):
> 	python_prog = """
> import incremental
> incremental.Version("package", 1, 2, 3, release_candidate=4)
> assert(str(v) == "[package, version 1.2.3rc4]")
> """
> 
> and have the base TestPythonBase class have some logic that executes
> this as a Python script with the Python interpreter.
> 
> It would make the thing a bit more readable. Also, the TestPythonBase
> class could push things a bit further, and have a default
> implementation of test_run() that does self.login() + execute the
> Python program in python_prog.
> 
> This way, those simple Python tests only need to provide the Buildroot
> configuration and the small Python program to run.

Good idea.
I am working on this, I will send a small series in the next few days: one
patch adding the common logic and expecting the sample script to be in a file
to be copied in build time and 6 patches each one changing one of the current
test cases.


Regards,
Ricardo
