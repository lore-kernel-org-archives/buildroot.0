From: Luca Ceresoli <list@lucaceresoli.net>
Date: Tue, 13 Jul 2010 22:49:34 +0200
Subject: [Buildroot] [PATCH/RFC] Download sources from Git (and more)
In-Reply-To: <20100713200820.1a5fcc60@surf>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>	<1279032219.2887.78.camel@dubciaranr1.verifone.com>
	<20100713200820.1a5fcc60@surf>
Message-ID: <4C3CD15E.8010607@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 13 Jul 2010 15:43:39 +0100
> Quotient Remainder <quotientvremainder@gmail.com> wrote:
>
>   
>>  - Do you see any way of making it possible to use the clone as the
>> actual working copy used by buildroot?  That is, if I clone a
>> repository (as opposed to archive) and then want to make changes, I
>> can edit the source and build/test the change in-place (in
>> output/build/package/) . As it stands with this patch set, I think it
>> would be necessary to make a change in the source in
>> $(PKG_NAME).git/, commit the change, note the new version, change the
>> package version in package/Makefile to the same and make will then
>> copy an entire snapshot to a new build-dir/pkg-newversion/.
>>     
>
> I understand this need: use Buildroot not only as an integration system
> to produce the final system, but also during the development of the
> application. For the moment, our recommended practice for this is to
> work on the application outside of Buildroot, as Buildroot is not
> well-suited for doing this.
>
> Adding such a capability to Buildroot requires a fairly wide
> brainstorming and discussion to propose a global design that solves
> this question. What do we want to achieve ? What is the exact use
> case ? How all development steps are going to work ?
>   
I understand your point, and I think the threads seen so far are a good
starting point for this discussion.

> For that reason, I think Maxime's patch is saner: it adds the simple
> capability of downloading a package from GIT/SVN, without changing the
> existing Buildroot workflow.
>   

After reviewing once again the two patches, I've come to the conclusion
that they are quite similar apart from a matter of code style.
Practically I don't think they have big pros/cons over each other.

Creating a tarball would be trivial to add to my patches.

Enabling `git pull` in Maxime's code would probably be easy if the
clone were put in a suitable directory.

Supporting more complex workflows (such as working copies within
the buildroot tree, or integrating git submodules) would require a
deeper analysis and substantial work in both cases.

The choice of which download helper  to use is more readable in
Maxime's code (case-based) but I suspect is more efficient in my
macro-based system which is also more uniform with the rest of
Makefile.package.in.

That said, I think both approaches are sane enough (after the few
discussed improvements) to be applied. I'd like to hear the
maintainer's opinion about this choice. The only one that I wouldn't
agree with is to reject both.

Luca
