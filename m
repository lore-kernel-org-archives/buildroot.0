From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 19:02:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] flatcc: new package
In-Reply-To: <CALupW3B76bWmAnLSLAizMgZBGwig5Gm6o3dG9q5ydtEaSyqqpw@mail.gmail.com>
References: <1462145376-1377-1-git-send-email-steve.derosier@lairdtech.com>
 <CAHXCMM+wVwqthUOEh+e3fHDA_=J0FS6FqG2cBF+zhVM0BGVoFQ@mail.gmail.com>
 <CALupW3BnsWbBFZhd+GQe26rtXsg-KZUsxkxupZ_5J88Yb14PeA@mail.gmail.com>
 <c0a641fc-b5ce-7c69-14f1-1b53f0af7623@mind.be>
 <CALupW3B76bWmAnLSLAizMgZBGwig5Gm6o3dG9q5ydtEaSyqqpw@mail.gmail.com>
Message-ID: <bbbedfcc-6c2f-4441-95ad-543ea1c53fef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/04/16 18:12, Steve deRosier wrote:
> On Tue, May 3, 2016 at 10:23 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 05/02/16 23:35, Steve deRosier wrote:
>>>
>>> Hi Samuel,
>>>
>>> Thanks for taking a detailed look at this. Hopefully my answers below
>>> will address your concerns.
>>>
>>>
>>> On Mon, May 2, 2016 at 12:44 PM, Samuel Martin <s.martin49@gmail.com>
>>> wrote:
>>>>>
>>>>> +
>>>>> ++# Options to control if we build static or shared libraries. Needed
>>>>> because
>>>>> ++# cmake has us explicitly do both versions if we want both versions.
>>>>> ++option(FLATCC_WITH_STATIC "Build the static version of the library"
>>>>> ON)
>>>>> ++option(FLATCC_WITH_SHARED "Build the shared version of the library"
>>>>> ON)
>>>>
>>>> I'm not a big fan of this because:
>>>> - it kinda adds some feature to flatcc;
>>>> - it completely by-passes the standard CMake way of driving
>>>> shared/static libs build (using BUILD_SHARED_LIBS) that the Buildroot
>>>> infrastructure automaticllay set [1].
>>>>
>>>
>>> I wish you spoke up two weeks ago when Arnout explicitly asked me to
>>> add the shared+static to the build. You could've saved me a good week
>>> of work and two weeks delay in getting support for this upstreamed.
>>
>>
>>  Well, I was just talking about your custom install commands. I didn't
>> realize that in the shared+static case, the static libs weren't even built.
>> I just noticed in your code that for a config variable that can have three
>> values (static, shared, static+shared) you only handled two (static,
>> others). So I made the remark that you forgot about the static+shared case,
>> with a suggestion about how it could be handled.
>>
>
> OK, understood. I guess I could've responded then that it doesn't
> build both and put some code in there to eliminate that case. Sorry, I
> misunderstood the review.
>
> But, now the work's been done to handle the extra case. I'd like see
> it go in with the extra functionality as we're going to upstream the
> feature anyway.
>
> @Samuel and @Arnout, does that plan sound OK? Can we move forward with
> this?  Or are there other things that I need to address?

  Hm, tricky...

  On the one hand, I don't want to block your submission over this issue.

  On the other hand, we don't want to carry a feature patch that may never be 
accepted upstream.

  Since the patch wasn't OK yet as it was (it should look at the global 
BUILD_SHARED_LIBS), isn't it easier to just drop that patch, and revert the 
installation commands to your original version, adding a comment that in the 
SHARED_STATIC case only shared libs are built anyway? Or is that too frustrating 
because you did redundant work?

  I can understand that it's frustrating. Actually, reading back what I wrote 
yesterday, I'm afraid that I may have made it worse by making you feel it was 
your own fault. But that's not at all the case: I haven't been sufficiently 
clear in my original review, and you can't magically know all the constraints 
that we try to satisfy.

  That said, a bit of frustration is going to be unavoidable here... I'm sorry 
we haven't been a better upstream for you. And to make it worse, it looks like 
your first submission has been even more unappreciated...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
