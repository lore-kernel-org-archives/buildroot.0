From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:26:07 +0100
Subject: [Buildroot] [PATCH v2] package/collectd: Specify FP layout
 based on endianness
In-Reply-To: <20171107200442.23067-1-andrew.smirnov@gmail.com> (Andrey
 Smirnov's message of "Tue, 7 Nov 2017 12:04:42 -0800")
References: <20171107200442.23067-1-andrew.smirnov@gmail.com>
Message-ID: <87vahwenps.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrey" == Andrey Smirnov <andrew.smirnov@gmail.com> writes:

 > Big-endian CPUs store floating point as big endian (at lest majority
 > of them do), so, in order for 'network' plugin to work correctly (and
 > potentially any user of htond() in collectd's codebase),
 > --with-fp-layout=endianflip as opposed to --with-fp-layout=nothing
 > needs to be specified during configuration phase.

 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 > ---

 > Changes in [v2]:

 >  - Patch converted to use target's endianness as opposed to CPU
 >    architecture
 
 >  - Added a notes about the discussion around "intswap"

 > [v2] http://lists.busybox.net/pipermail/buildroot/2017-October/205773.html

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
