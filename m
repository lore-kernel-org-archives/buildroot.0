From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 20 Sep 2013 20:23:46 +0200
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
	dependencies first
In-Reply-To: <523B50E4.6020906@mind.be>
References: <patchbomb.1379587632@argentina>
 <246bed054da59d6508dc.1379587635@argentina>
 <523B50E4.6020906@mind.be>
Message-ID: <CAAXf6LV1X0ZzZmwgVUg+s8+6iXr-EBFwBAxeKJy4EhtBODMwpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Sep 19, 2013 at 9:30 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 19/09/13 12:47, Thomas De Schampheleire wrote:

>> +manual-check-dependencies:
>> +       $(Q)if [ -z "`which a2x 2>/dev/null`" ]; then \
>> +               echo "You need asciidoc on your host to generate the
>> manual"; \
>> +               false; \
>
>
>  I don't think this works. I think you need "exit 1;".
>

It does work in fact, because the return code of the if statement is
false (the last statement within it) and the two ifs are not chained
in one subshell. Hence, make stops at the first failing command (the
first failing if).

But it's a fragile construction, because if someone later decides to
chain both ifs in one subshell, then it stops working. So I will
indeed change it to exit 1.

Best regards,
Thomas
