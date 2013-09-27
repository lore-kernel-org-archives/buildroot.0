From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 27 Sep 2013 16:27:50 +0200
Subject: [Buildroot] [RFCv1 09/11] package: add a <pkg>_SOURCE_ADDONS
 variable
In-Reply-To: <CAAXf6LVQ7HuAs3LLdVj1jUAmcdtZa_s5P=mrPGRA+Crr1HseDw@mail.gmail.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LVXRvw34-d5vq9Oh+tZXd2a4Dzy1mxzWLdOS2FPs59vVA@mail.gmail.com>
 <20130916203130.2307521a@skate> <523759FA.5040706@mind.be>
 <CAAXf6LVQ7HuAs3LLdVj1jUAmcdtZa_s5P=mrPGRA+Crr1HseDw@mail.gmail.com>
Message-ID: <524595E6.4080700@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire wrote:
> Thomas, Arnout,
>
> On Mon, Sep 16, 2013 at 9:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 16/09/13 20:31, Thomas Petazzoni wrote:
>>> Dear Thomas De Schampheleire,
>>>
>>> On Mon, 16 Sep 2013 15:39:22 +0200, Thomas De Schampheleire wrote:
>>>
>>>> What about allowing FOO_SOURCE to contain multiple words directly, and
>>>> thus not introducing a new variable? The package infrastructure can
>>>> download each word of FOO_SOURCE, but only extract (and otherwise use)
>>>> the first one. Any subsequent word has to be handled by the package
>>>> itself.
>>>
>>> The problem is that the default extract step needs to know what to do.
>>> And what it does today is that it extracts the tarball whose name is
>>> given in FOO_SOURCE. If we put several words in FOO_SOURCE, then what
>>> should be the semantic of the default extract commands? Extract the
>>> first one? All of them?
>>>
>>> That's why I've decided to go with another variable, which really means
>>> "I want this stuff to be downloaded, but don't do anything with it, the
>>> package recipe will take care of it".
>>>
>>> Of course, I'm open to changing the semantic of FOO_SOURCE instead, we
>>> would just need to define what this new semantic should be.
>>
>>   I'm more in favour of the <pkg>_SOURCE_ADDONS proposal. I think having
>> multiple _SOURCE files would be confusing.
> Ok, fair enough.
> I think you should add this to the documentation, then.

I also think keeping things separate is the best option to avoid confusion.
But to make it even more clear, I would name the variable _EXTRA_DOWNLOADS.

-- 
Luca
