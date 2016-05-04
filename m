From: Steve deRosier <derosier@gmail.com>
Date: Wed, 4 May 2016 09:12:54 -0700
Subject: [Buildroot] [PATCH v2 1/1] flatcc: new package
In-Reply-To: <c0a641fc-b5ce-7c69-14f1-1b53f0af7623@mind.be>
References: <1462145376-1377-1-git-send-email-steve.derosier@lairdtech.com>
 <CAHXCMM+wVwqthUOEh+e3fHDA_=J0FS6FqG2cBF+zhVM0BGVoFQ@mail.gmail.com>
 <CALupW3BnsWbBFZhd+GQe26rtXsg-KZUsxkxupZ_5J88Yb14PeA@mail.gmail.com>
 <c0a641fc-b5ce-7c69-14f1-1b53f0af7623@mind.be>
Message-ID: <CALupW3B76bWmAnLSLAizMgZBGwig5Gm6o3dG9q5ydtEaSyqqpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 3, 2016 at 10:23 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05/02/16 23:35, Steve deRosier wrote:
>>
>> Hi Samuel,
>>
>> Thanks for taking a detailed look at this. Hopefully my answers below
>> will address your concerns.
>>
>>
>> On Mon, May 2, 2016 at 12:44 PM, Samuel Martin <s.martin49@gmail.com>
>> wrote:
>>>>
>>>> +
>>>> ++# Options to control if we build static or shared libraries. Needed
>>>> because
>>>> ++# cmake has us explicitly do both versions if we want both versions.
>>>> ++option(FLATCC_WITH_STATIC "Build the static version of the library"
>>>> ON)
>>>> ++option(FLATCC_WITH_SHARED "Build the shared version of the library"
>>>> ON)
>>>
>>> I'm not a big fan of this because:
>>> - it kinda adds some feature to flatcc;
>>> - it completely by-passes the standard CMake way of driving
>>> shared/static libs build (using BUILD_SHARED_LIBS) that the Buildroot
>>> infrastructure automaticllay set [1].
>>>
>>
>> I wish you spoke up two weeks ago when Arnout explicitly asked me to
>> add the shared+static to the build. You could've saved me a good week
>> of work and two weeks delay in getting support for this upstreamed.
>
>
>  Well, I was just talking about your custom install commands. I didn't
> realize that in the shared+static case, the static libs weren't even built.
> I just noticed in your code that for a config variable that can have three
> values (static, shared, static+shared) you only handled two (static,
> others). So I made the remark that you forgot about the static+shared case,
> with a suggestion about how it could be handled.
>

OK, understood. I guess I could've responded then that it doesn't
build both and put some code in there to eliminate that case. Sorry, I
misunderstood the review.

But, now the work's been done to handle the extra case. I'd like see
it go in with the extra functionality as we're going to upstream the
feature anyway.

@Samuel and @Arnout, does that plan sound OK? Can we move forward with
this?  Or are there other things that I need to address?

Thanks,
- Steve
