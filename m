From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 01 Mar 2015 22:52:41 +0100
Subject: [Buildroot] [PATCH 00/13] autobuild-run: python3 compat and
	misc improvements
In-Reply-To: <CAGrucu3y+dK6ifA86fKfTDPCwqm9tOtv3vaW-NCgSMg-wu6wnQ@mail.gmail.com>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
 <20150226110858.183d31f3@free-electrons.com>
 <EEF2BEA7-3CA2-4250-8E78-E2585246EE66@gmail.com>
 <54F258AD.5040301@mailerd.de>
 <CAAXf6LXbRo40L9HZHZKcmHBqMz-KtOXvipQ1GrPd57DhUKzo3Q@mail.gmail.com>
 <CAGrucu3y+dK6ifA86fKfTDPCwqm9tOtv3vaW-NCgSMg-wu6wnQ@mail.gmail.com>
Message-ID: <06D2305A-C43B-470D-A1C3-941D44CB367B@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On March 1, 2015 10:37:09 PM CET, "Andr? Erdmann" <dywi@mailerd.de> wrote:
...
>>>
>>> The advantage of docopt is that it's really simple and you always
>have the
>>> usage message in the script, but I'd prefer argparse primarily
>because it's a built-in
>>> module (in py >= 2.7). It also features arg validation (via
>type=<function|type>).
>>> There's much more like subparsers, call a <function> each time an
><arg> is encountered
>>> and whatnot, but that's not of interest here.
>>>
>>> The major improvement of the docopt approach is reading the config
>(argv/file)
>>> into a few dicts that can be easily merged rather than doing a 3-way
>merge manually
>>> (defaults as locals X ini file parser X argparser namedtuple-like
>object). That's a
>>> good idea. It's doable with argparse as well,
>"vars(parser.parse_args())" returns
>>> the parsed args as dict.
>>>
>>> So, the ((untested)) prototype of a "dict-improved" config_get()
>argparse variant would be:
>>>
>>>
>>> [...]
>>>
>>
>> Thanks a lot for your feedback.
>>
>> Maybe it's because I haven't seen the full solution yet, but this
>> handling seems much more involved than the docopt approach. In
>> particular it's odd that there would need to be explicit handling of
>> things like nonempty or positive_int, which isn't necessary with
>> standard argparse nor docopt.
>
>They're purely optional - I've just put them in there to demonstrate
>how the input can be restricted so that "--ninstances hello" would get
>rejected by the parser (which docopt would not). You could also set
>"type=int" instead of "type=positive_int", which is shorter code-wise,
>but slighlty less correct.

Thanks for clarifying, it makes more sense to me now. Keeping argparse but using the
 dict-merging isn't too bad, it would address my main concern with the original
 code (the not-so-beautiful handling of the arguments).

So Thomas P: it's your call now: I'm just as ok with going for the approach proposed
 by Andr?.

Best regards,
Thomas
