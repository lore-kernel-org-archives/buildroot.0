From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 16 Oct 2019 23:38:08 -0300
Subject: [Buildroot] [PATCH v2 2/2] support/testing: add python-django
 test
References: <20191016212852.7506a8ff@windsurf.home>
Message-ID: <5da7d410e431c_70be3fe22a15ee2881774@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Oct 16, 2019 at 04:28 PM, Thomas Petazzoni wrote:

> On Wed, 16 Oct 2019 12:09:00 -0700
> aduskett at gmail.com wrote:
> 
>> This test comprises of two simple steps:
>>   1: Start a new simple project called testsite.
>>   2: Run ./manage.py migrate on the new testsite.
> 
> Don't we want to actually run the site in the local webserver, and
> connect to it ?

Certainly it would be better.

The python-twisted test uses a mid-ground solution, by starting the server in
background and checking with netstat that the server did opened the expected
port.

[snip]
>> +++ b/support/testing/tests/package/test_python_django.py
>> @@ -0,0 +1,26 @@
>> +from tests.package.test_python import TestPythonPackageBase
>> +
>> +
>> +class TestPythonDjango(TestPythonPackageBase):
>> +    config = TestPythonPackageBase.config
>> +    sample_scripts = ["tests/package/sample_python_django.py"]
>> +
>> +    def run_sample_scripts(self):
> 
> Is this method really executed ? I thought only methods starting by
> test_<something>() were executed. Our current typical practice is to
> call the main test method test_run().

Yes. The test_run is declared in the parent class TestPythonPackageBase and it
calls this method.
The same (overriding run_sample_scripts) is already done in the python-twisted
test.


Regards,
Ricardo
