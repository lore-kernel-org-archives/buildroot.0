From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 16 Jul 2016 18:57:04 +0200
Subject: [Buildroot] Buildroot, github and nopullrequest.com
In-Reply-To: <CA+TH9Vn=t1owd1MQJRHa=2JDeOntACrE5q15CBWjqp2JEamsew@mail.gmail.com>
References: <CA+TH9VnO2kF00pQJB3K_f6NcRboq3afw-MmxM1sNHxXWpjdThw@mail.gmail.com>
 <20160716164604.GA3882@free.fr>
 <CA+TH9Vn=t1owd1MQJRHa=2JDeOntACrE5q15CBWjqp2JEamsew@mail.gmail.com>
Message-ID: <CA+TH9V=1c=45qFW=PcBXwHwBQjXHsrAeEqucZHJecRaDruECUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

2016-07-16 18:52 GMT+02:00 Angelo Compagnucci <angelo.compagnucci@gmail.com>:
> Dear Yann, All
>
> 2016-07-16 18:46 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
>> Angelo, All,
>>
>> On 2016-07-16 14:44 +0200, Angelo Compagnucci spake thusly:
>>> Personally, I'm really sad that the buildroot infrastructure is
>>> currently down from a few days, buildroot is such a wonderful project
>>> that not merits such a shame.
>>
>> Yes, DDoS are painful... :-(
>>
>>> Obviously, the infrastructure behind buildroot is not up to date to
>>> the current standards, I think we should change.
>>
>> That's something that had been floating for the past year or so...
>>
>>> So, I'm drafting a tentative approach, and I'm sharing it with you.
>>> Obviously I'm not entitled in acting in any way, but hey, can I dream
>>> for a better Buildroot?!
>>
>> Your input is much welcome! :-)
>>
>> We all believe self-hosting is a waste of time: it's too difficult, we
>> don't really need it, and it would not be much better than what we have
>> today. We all believe a forge of some sort is what we want to go to.
>>
>>> 1) Website: we have a github account, we have github pages, we should
>>> switch there! The only downside here is that github pages doesn't
>>> suppo SSI, so we should write a simple bash script to assemble the
>>> website before publication. Github pages resides on their own
>>> repository, so we can have the website as always in the main
>>> repository and the bash script will assemble the website in an outside
>>> directory where the other repository it's cloned.
>>
>> There is also Gitlab. I would favour Gitlab over github, if at least
>> because it is an open source project, not a closed, walled garden like
>> Github is. All things being equal, Gitlab is on par with github
>> regarding the features we need, plus a killer one: we can disable PRs
>> alltogether with Gitlab, which we can't with Github.
>
> Could you point to some documentation on how to do that?! I'm
> interested but I can find anything!

I created an account and discovered quite easily how to do that!
Wonderful! Long live to Gitlab!

>
>>
>> And if we were ever to re-self-host, we could take the data as-is with
>> our own instance of Gitlab. And even if moving to something else than
>> Gitlab, taking the data out of Gitlab is easier than out of Github.
>>
>>> 2) We have a github account, we should use it as the main repository.
>>> No other words here.
>>
>> Or Gitlab! ;-)
>>
>>> 3) Githb pull requests. Obviously, we won't github pull requests, and
>>> here enters the game https://nopullrequests.com.
>>
>> Or Gitlab, which allows to disable PRs altogether.
>>
>>> It's a simple github
>>> webhook that closes a PR with a message. The source is publicly
>>> available on github. We can use that service as is, or run an instance
>>> ourselves on GAE.
>>
>> As Thomas said, I'm not too comfortable with allowing a third party
>> automatic access to our repo. Especially since it looks like it wants a
>> Google account.
>>
>> As for running an instance ourselves, it would mean we self-host again,
>> which wee don;t want.
>>
>>> I had a look at the source code and it's pretty
>>> secure, once it's authorized on github, it receives a message on each
>>> pull requests and replies immediately without keeping anything
>>> (caching or disk). Hosting our instance on GAE will have the benefit
>>> on personalizing the commit message with something more specific than
>>> the pretty aseptic default message.
>>>
>>> 4) Issues: well, everything is better than bugzilla!
>>
>> Issues in Github are a pain IMHO: except for their "template", there is
>> no possibility to have arbitrary fields. Git lab is not much better in
>> this respect either.
>>
>> And there's still the emails for each commit: neither Github nor Gitlab
>> can do that; they can only send an email per push, not per commit.
>>
>> However, with Gitlab, it looks like we could implement it and do a PR.
>> With Github, there's no way we can do it.
>>
>>
>> So, lemme recap:
>>
>>                             | Github            | Gitlab            |
>> ----------------------------+-------------------+-------------------+
>> License                     | Proprietary       | Open Source       |
>> Network effect              | Definitely        | Somewhat          |
>> git tree                    | Yes               | Yes               |
>> Web pages                   | Static            | Static            |
>> web hooks                   | Yes               | Yes               |
>> C.I.                        | Yes, many [0]     | Yes, many [1]     |
>> emails                      | on push           | on push [2]       |
>> IRC                         | No?               | irker             |
>> Markup language             | Markdown (MD)     | Markdown (MD)     |
>> README                      | Yes, MD           | Yes, MD           |
>> Issue tracker               | Yes, minimal, MD  | Yes, minimal, MD  |
>> Snippets                    | Yes               | Yes               |
>> Export project data         | No?               | Yes               |
>>
>>
>> So there is no clear winner. The only things that would tip the scale is
>> the license and the possibility to have per-commit emails.
>>
>> My favourite is obviously Gitlab. ;-)
>>
>>
>> [0] of which, Travis
>> [1] of which, Jenkins
>> [2] The source code is available, we could do the modifications and
>>     submit back to Gitlab; for now, I opened an issue there;
>>     https://gitlab.com/gitlab-org/gitlab-ce/issues/19901
>>
>> Regards,
>> Yann E. MORIN.
>>
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
>
>
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
