From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 29 Nov 2017 14:28:55 +0100
Subject: [Buildroot] Analysis of build results for 2017-11-25
In-Reply-To: <20171128233028.a7dqd7nmj6q5hf6r@tungsten.ozlabs.ibm.com>
References: <20171126070006.676FA209DE@mail.free-electrons.com>
 <20171126152140.0fd3902b@windsurf.home>
 <CAJtjsKZjOxXO=Gu475a+6gP9TR4RrEptaS1MfuHYpdzjbF5Aig@mail.gmail.com>
 <OF3CB5EEB3.059011A8-ON002581E5.004E2384@notes.na.collabserv.com>
 <20171128233028.a7dqd7nmj6q5hf6r@tungsten.ozlabs.ibm.com>
Message-ID: <CAJtjsKbTBDN8zaOOR5FLfC-rXq7WDskvVu-M6Y1sgZzcTTSBog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam, All,

On Wed, Nov 29, 2017 at 12:30 AM, Sam Bobroff <sam.bobroff@au1.ibm.com> wrote:
> On Mon, Nov 27, 2017 at 03:13:24PM +0100, Thomas Petazzoni wrote:
>> On Mon, 27 Nov 2017 15:01:29 +0100, Johan Oudinet wrote:
>>
>> > > Also, perhaps this is something our PowerPC64 friends from IBM could
>> > > help fixing? Sam? Joel?
>
> I don't have much time at the moment but I'll take a look at this when I
> can (in a previous life I was an Erlang programmer, it's great to see it
> as part of buildroot!). It would be sad to disable HiPE so I'll see if
> we can just bump the version up to 20.
>
> Or Johan if you get to it first, I'll certainly test it :-)

I haven't had the time to do it yet, however, it seems OTP 20 has
simply applied the patch I mentioned:
https://github.com/erlang/otp/pull/1394/commits/024e438101c010f17e3a374117c3b376d48483f3

If I understand correctly this configure, there is a test in the
configure to automatically enable HiPE for a list of architectures.
ppc64 is present in this list but not ppc64le. So, I think HiPE would
be disabled on ppc64le architectures even if we bump to OTP 20.

Best,
-- 
Johan
