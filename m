From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 May 2016 19:23:13 +0200
Subject: [Buildroot] [PATCH v2 1/1] flatcc: new package
In-Reply-To: <CALupW3BnsWbBFZhd+GQe26rtXsg-KZUsxkxupZ_5J88Yb14PeA@mail.gmail.com>
References: <1462145376-1377-1-git-send-email-steve.derosier@lairdtech.com>
 <CAHXCMM+wVwqthUOEh+e3fHDA_=J0FS6FqG2cBF+zhVM0BGVoFQ@mail.gmail.com>
 <CALupW3BnsWbBFZhd+GQe26rtXsg-KZUsxkxupZ_5J88Yb14PeA@mail.gmail.com>
Message-ID: <c0a641fc-b5ce-7c69-14f1-1b53f0af7623@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/16 23:35, Steve deRosier wrote:
> Hi Samuel,
>
> Thanks for taking a detailed look at this. Hopefully my answers below
> will address your concerns.
>
>
> On Mon, May 2, 2016 at 12:44 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>>> +
>>> ++# Options to control if we build static or shared libraries. Needed because
>>> ++# cmake has us explicitly do both versions if we want both versions.
>>> ++option(FLATCC_WITH_STATIC "Build the static version of the library" ON)
>>> ++option(FLATCC_WITH_SHARED "Build the shared version of the library" ON)
>> I'm not a big fan of this because:
>> - it kinda adds some feature to flatcc;
>> - it completely by-passes the standard CMake way of driving
>> shared/static libs build (using BUILD_SHARED_LIBS) that the Buildroot
>> infrastructure automaticllay set [1].
>>
>
> I wish you spoke up two weeks ago when Arnout explicitly asked me to
> add the shared+static to the build. You could've saved me a good week
> of work and two weeks delay in getting support for this upstreamed.

  Well, I was just talking about your custom install commands. I didn't realize 
that in the shared+static case, the static libs weren't even built. I just 
noticed in your code that for a config variable that can have three values 
(static, shared, static+shared) you only handled two (static, others). So I made 
the remark that you forgot about the static+shared case, with a suggestion about 
how it could be handled.

[snip]

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
