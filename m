From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 Aug 2013 08:56:55 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-08-24
In-Reply-To: <CAAXf6LWQ8wYQzw97__ECmUAf7ocK1t8OB3L83gbfjgBqd7gMZA@mail.gmail.com>
References: <20130825063005.DE08A52C1CB@lolut.humanoidz.org>
 <CAAXf6LWQ8wYQzw97__ECmUAf7ocK1t8OB3L83gbfjgBqd7gMZA@mail.gmail.com>
Message-ID: <5219F107.2030208@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/25/2013 04:32 AM, Thomas De Schampheleire wrote:

>> Classification of failures by reason
>> ====================================
>>
>> make: *** [target-finalize]... | 96
> 
> Oops, what happened here?

Commit fde2605765fd99565ebcde48c5411a69646c2cce
test -d will always return 1 if the directory doesn't exist, which is
the case when kernel/modules aren't built.
The construct should be something like:
if test -d $(TARGET_DIR)/lib/modules; then ....; fi
Regards.
