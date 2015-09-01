From: Denis Thulin <denis.thulin@openwide.fr>
Date: Tue, 1 Sep 2015 11:52:31 +0200 (CEST)
Subject: [Buildroot] [PATCH 0/6] [RFC] Adds test infrastructure for
 packages
In-Reply-To: <20150831144828.59f18355@free-electrons.com>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
 <20150831144828.59f18355@free-electrons.com>
Message-ID: <1742299008.346179.1441101151493.JavaMail.zimbra@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for answering that fast.

It seems I the use case for this patch series is not clear.
I'm trying to create tests for Buildroot users, those tests
are not intended for autobuilds (They could be used, but that
was not what I intented when I wrote this patch series).

----- Le 31 Ao? 15, ? 14:48, Thomas Petazzoni thomas.petazzoni at free-electrons.com a ?crit :

> Denis,
>
> On Mon, 31 Aug 2015 11:59:05 +0200, Denis THULIN wrote:
>> This patch series adds a test generation infrastructure for packages to
>> Buildroot.
>> The generated tests are robotframework tests.
>>
>> While it is always necessary to test that packages are installed
>> correctly and work in an intended way, Buildroot does not currently
>> provide any tests of package nor any way to automate the process of
>> creating tests depending on your configuration or even share tests you
>> have written for packages. You have to write tests manually almost
>> everytime you start a new project with buildroot. This can cost a lot
>> of time.
>>
>> This patch series is intented as a solution for that problem.
>
> Thanks a lot for working on the topic of runtime testing, which is an
> important topic that needs to be addressed in the Buildroot community.
>
> However, I have to say I personally dislike quite a bit some of the
> principles of your solutions:
>
> * I don't like the Robot Framework. It requires you to learn another
>   new, specialized (and weird) language to write tests, instead of
>   simply writing them in Python. The Robot Framework is probably good
>   when the people who will write the tests are not developers. But
>   that's not the case of Buildroot users and developers. Many of them
>   probably already know Python (or at least the basics of it), while
>   nobody knows this specialized language. It will be a barrier to
>   getting tests written by Buildroot contributors.

There seems to be a big misunderstanding here. This patch series is
not meant for the same use case as
https://github.com/tpetazzoni/buildroot-runtime-test or 
what I wrote at  https://github.com/etkaDT/Rfw-buildroot-tests

The test infrastructure is meant to be used by Buildroot users rather
than Buildroot devs. The goal here is for users to test if their
packages work properply with their Buildroot configuration, not
to test if the packages work in general.

In that context, I feel that it is important that anybody can understand
the tests results.

>
> * I don't think tying tests to packages is the correct idea. Some
>   tests need to be done for filesystem formats, some tests for core
>   mechanisms (like checking BR2_EXTERNAL functionality, checking core
>   package infrastructure mechanisms, etc.). I don't think the test
>   mechanism should modify Buildroot itself.
>

Well those tests are not included in the use case I'm working on and I
don't think they should be.

> Also, this may be me not understanding properly, but I fail to see
> where are your test cases. My impression is that you add tests to
> packages, and then your idea is that whenever a package is enabled in a
> given configuration, you will run the tests of this package. But who
> will generate the configurations to be tested? They surely cannot be
> randomly generated, because many combinations of packages do not make
> sense (for example a random configuration that has Dropbear and OpenSSH
> enabled will build fine, but will completely fail at runtime because
> both will try to bind on port 22).

You understand how these tests works.
Again, those tests are not meant to work with random configurations
but rather with a user's configuration.
In that case, the user will notice that his configuration is not working
and will change it so that his packages work correctly.


>
> I certainly do not claim that my proposal at
> https://github.com/tpetazzoni/buildroot-runtime-test was ideal and
> perfect, but it is IMO much more in-line with what we need for
> Buildroot: fully written in a language that is generally well-known,
> and a simple list of test-cases that associate a configuration to be
> built/executed with a set of actions to be verified.

I agree on that point,
This patch series is just meant for a different use case.

Best regards,
Denis

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
