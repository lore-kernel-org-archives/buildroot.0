From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 6 Oct 2016 18:39:43 +0200
Subject: [Buildroot] Next Buildroot Developers Meeting approaching
In-Reply-To: <20161006170454.1249b20f@free-electrons.com>
References: <20161003234044.55b98568@free-electrons.com>
 <b385be1d-a433-331d-2d52-720b18bf43f1@mind.be>
 <20161006170454.1249b20f@free-electrons.com>
Message-ID: <1ab3e874-f752-68e8-1941-99dcbd33d95c@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas, Arnout,

On 06/10/2016 17:04, Thomas Petazzoni wrote:
[...]
>>> On my side, I think I'd like to spend a significant part of the 3 days
>>> working on the testing infrastructure. But to do so, I'd like to team
>>> up with someone present during the Developers Meeting. If someone is
>>> interested, let me know.  
>>
>>  I'm interested!

And I am too!

>>  I think there are in fact three completely different testing enhancements we
>> should consider:
>>
>> 1. Run-time testing, e.g. of the autobuilder artefacts.
> 
> Testing the autobuilder artefacts do not make sense. A large number of
> the configurations we build do not make any sense to test at runtime.
> Just a quick example: we allow building both Dropbear and OpenSSH in
> the same image. What happens when you boot: two daemons try to bind on
> port 22. Same thing with web servers for example.
> 
> So I don't think runtime testing the autobuilder artefacts makes sense.
> 
> However, what makes sense is to runtime test a set of configurations
> that we define, and progressively extend to cover more and more cases.
> 
>> 2. Feature testing of Buildroot features, like BR2_EXTERNAL, umask handling,
>> graph-depends, etc.
> 
> To me (1) and (2) is basically the same thing. The infrastructure I
> have proposed at https://github.com/tpetazzoni/buildroot-runtime-test
> handles both things:
> 
>  - runtime testing of generated images
>  - testing Buildroot features (filesystem images, for example)
> 
>> 3. Extending the existing autobuilders with kernel and bootloader builds.
> 
> With the above infrastructure, you can add test cases to build the
> kernel on various architectures, build various bootloaders in a number
> of configurations, etc.
> 
>>  I guess you would concentrate on 1. I would love to work on 2, but I'm not so
>> efficient so perhaps my time is better spent on reviewing + looking over your
>> shoulder.
> 
> I'm still undecided on what's the right tool for the job. The
> infrastructure I've proposed in the Github repository mentioned above
> has some annoying shortcomings, which I'm not sure how to address.
> 
> Maybe this is something Luca has more experience with?

Probably not much, sorry. But I don't remember in detail the work you
did. I'll try to refresh my memory before the meeting.

-- 
Luca
