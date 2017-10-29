From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Oct 2017 21:20:39 +0100
Subject: [Buildroot] [PATCH v2 6/6] support/testing: fix remaining code
	style
In-Reply-To: <59f5530f9807a_d683ff5ec889c9036b5@ultri3.mail>
References: <270bdcac-d8f0-d6db-bd84-f850a2d645bc@mind.be>
 <59f5530f9807a_d683ff5ec889c9036b5@ultri3.mail>
Message-ID: <6962914b-84e2-b37a-8182-455e41e31268@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-10-17 05:03, Ricardo Martincoski wrote:
> Hello,
> 
> On Mon, Oct 23, 2017 at 06:34 AM, Arnout Vandecappelle wrote:
> 
>> On 23-10-17 04:30, Ricardo Martincoski wrote:

[snip]
>>> I don't know a way to enforce it is always installed (to always generate such
>>> warnings and get the same result).
>>
>>  We don't need to enforce it. What we need is to make sure that GitLab-CI does
>> have this, so it *will* check the naming (when we have a test for flake8,
>> obviously). You can do that by updating support/docker/Dockerfile (and I'll
>> rebuild the docker image when I apply the patch).
> 
> Good to know how to add things to the image..
> I won't do that because I understand from you (below) that it's better to add
> apt install python-flake8
> to .gitlab-ci.yml.in in this case.

 Ah yes, I wrote the mail in pieces and forgot to update the top part.

> 
>>> To also ignore warnings generated when the plugin flake8-docstrings is
>>> installed, this line could be used instead:
>>> ignore=N,D
>>
>>  Good idea, let's check the docstrings as well!
> 
> Eventually...
> 
> By default the plugin would generate 200+ warnings because it expects every
> single package, module, function, method to be documented.
> I don't think it is useful to add a lot of obvious documentation, the good thing
> IMO is to document the tricky ones.
> 
> So I suggest to use 'flake8 --ignore=D1' that will check the style of the
> docstrings but would not generate a lot of 'Missing docstring in'.
> And during the review ask for documentation on tricky parts of the code.

 Good idea. And I guess the ignore=D1 can be put in the .flake8 file, right?


> Of course it's not good to let a test failing in the gitlab-ci for a long time,
> so let's fix style of the docstring already in the code before adding this.
> I will eventually do that.
> But first I will fix warnings in support/scripts and utils.

 Sure!


[snip]
>>  Oh, now I notice that this won't work because our test infra is not Python3
>> compliant. That would be nice to fix as well :-) Apparently docstrings only
>> exists for python3 (at least on my Debian, don't know about Ubuntu).
> 
> I started the image buildroot/base locally and using pip it succeeds for python
> 2:
> apt update
> apt install python-pip
> pip install flake8-docstrings

 Ah OK, I only checked what was available as a Debian package, not with pip.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
