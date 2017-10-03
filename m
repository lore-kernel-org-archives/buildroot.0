From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 02 Oct 2017 22:05:55 -0300
Subject: [Buildroot] [RFC PATCH 1/1] testing/infra: add test for code
	style
References: <20171002062723.GD4753@scaer>
Message-ID: <59d2e2735d8e2_18423fe6f88598049870@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 02, 2017 at 03:27 AM, Yann E. MORIN wrote:

> On 2017-10-01 22:17 -0300, Ricardo Martincoski spake thusly:
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>> ---
>> NOTICE: this would require to install flake8 to the docker image
>> buildroot/base.
>> 
>> The configs could be fine-tuned by either adding options to the call,
>> such as:
>>  "--max-line-length=132",
>> or pointing to the config file:
>>  "--config={}".format(infra.filepath("conf/unittest.cfg")),
>> and adding to support/testing/conf/unittest.cfg something like this:
>>  [flake8]
>>  max-line-length=132
>> as pointed out by Yann E. MORIN in the review of
>> http://patchwork.ozlabs.org/patch/819800/
> 
> Note that if the file is support/testing/setup.cfg, then flake8 will
> automatically find it, without the need for passing the --config option.

Indeed. Also in any parent directory it works, i.e. support/setup.cfg

> 
> It can also be named support/testing/.flake8, but I don't like
> dot-files, as they are hard to find.

This filename seems suitable to use in the root directory of the project:
buildroot/.flake8

So with one file we would cover support/, utils/ and also the test files in each
package directory.

And even this RFC patch becomes almost useless.

> 
> If we wanted to sharea  single file for nose2 and flake8, then we could
> move support/testing/conf/unittest.cfg to support/testing/setup.cfg.
> But why would we want to share a single file for the two different
> tools?

Fair enough. We don't need to share a single file.

Regards,
Ricardo
