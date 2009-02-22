From: Frank Hoeflich <frankhoeflich@yahoo.com>
Date: Sat, 21 Feb 2009 23:22:09 -0800 (PST)
Subject: [Buildroot] Buildroot 2009.02 released
Message-ID: <759168.10229.qm@web56905.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf:

>fre 2009-02-20 klockan 09:23 +0100 skrev Peter Korsgaard:
>> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>> 
>> Hi,
>> 
>>? >> Some testing was certainly done, but more is ofcourse always welcome.
>> 
>>? Ulf> I am not aware that anyone but myself has published any test results.
>> 
>> I did for the toolchains, and for everything else I just fixed the
>> problems when I found any.
>> 
>>? Ulf> There is no recommended way to publish test results.
>>? Ulf> No recommended format etc.
>> 
>> Sure, like with all other issues - Add an issue to the tracker or mail
>> the list, both preferably with a patch.
>
>You REALLY dont get it , do you?
>
>If you for once stopped seeing Buildroot as a hobby
>and take the view of someone wanting to build 
>a root file system without digging deep into 
>the internals of Buildroot, then you would realize
>that Bugzilla is NOT the way this shoudl be communicated.
>
??? OK, enough.? Ulf, I am asking you to stop taking this tone with Peter (and for that matter the rest of us).

??? FWIW I agree with you (and more) that:
??? 1. Buildroot needs a real test plan for the new releases, and some method of
??????? distributing the test suite so that list members can contribute new individual tests as
??????? they see fit in order to fill out the BR test suite.
??? 2. Buildroot should meet its (reasonable) release test plan criteria before a release goes
??????? out the door, like any other software package worth its salt.? For now these could be
??????? pretty modest.
??? 3. Buildroot test results should be published and visible on the web and should cleanly
??????? hyperlink or otherwise refer back to test plan requirements.? Once the list agrees on a
??????? format for results it should be documented in the test plan.
??? 4. Buildroot test vectors should certainly include a reasonable selection of default
??????? configs, a representative set of architectures, host distributions and more.

??? However, I do *not* agree that:
??? 1. Anyone active on this list is treating BR like a hobby.? Nor is it like a commercial
??????? product for which users may expect polished manuals and 24x7 support for their
??????? RTFM questions.? It's an open source project; users need to be willing and able to
??????? follow the list and/or query Bugzilla in order to check that something they're seeing is
??????? a known issue.
??? 2. Issues posted to Bugzilla are not `in a usable format'.? They are searchable, are
??????? capable of being well-documented, may contain descriptive attachments as needed
??????? and have adequate flags for prioritisation and status.
??? 3. BR development should be targeted toward users `without too much knowledge'.
??????? Such users can always hire an active developer as an interpreter/jungle guide.? Linux
??????? and most of the open source world do not lend themselves at all well to users without
??????? a reasonable amount of hands-on knowledge.? `Fixing' that would mean grinding a
??????? much larger axe, I think.
??? 4. All of the testing and documentation issues mentioned should have been addressed
??????? in Buildroot's first release in years.? If this release serves 80%+ of the BR public
??????? with workaroundable annoyance only pending a next release of better stability, it will
??????? have done its job.? Getting to metricatable quality may take quite some time.

??? It may be that buildbot can nearly accommodate all of this now, or it may be that a good deal of further development is needed.

>You want to know what builds and what doesn't.
>If it does not build, then you do not even want 
>to try to build it.
>
>Bugzilla is useful to document what goes wrong.
>For users, you want a simple yes/no answer if this builds or not.
>
>>? Ulf> Once it is discovered that there is a problem, there is no clean
>>? Ulf> way to inform the user that there is a problem with a certain
>>? Ulf> package so each new user will waste a lot of time trying
>>? Ulf> to build what is known to be broken.
> >
>> Well, if you mail the list or add an issue, there is.
>
>Not in a usable format.
>
>>? Ulf> Depending on BROKEN is wrong if it builds for other architectures,
>> 
>> Yes, it should be depends on BROKEN if BR2_<arch> ofcourse.
>> 
>>? Ulf> There are several packages that does not build, at least for ARM.
>>? >> 
>>? >> Well, let's work on them then. Please start by providing a list -
>>? >> Either here or as bugtracker issues.
>>? >> 
>> 
>>? Ulf> My docs/buildall.sh has comments on what is broken for ARM.
>> 
>> And as I commented several times, your setup is not representative for
>> normal buildroot users as several packages that didn't build with your
>> script builds just fine in a normal buildroot setup.
>
>There are dependencies on the host distribution.
>I have seen that some packages sometimes use the host includes.
>
>If the host includes do things in the same way as the buildroot
>includes that should have been used, then the build can
>complete, even though the package is inherently BROKEN.
>
>If they are different, then the build breaks.
>
>
>> 
>>? Ulf> I think that running this for different architectures will show if
>>? Ulf> they build or not.
>> 
>>? Ulf> As for running different applications, I hear that gtk does not run,
>>? Ulf> but I dont extensively test applications.
>> 
>> I used it ~1 month ago on ARM without problems. If you find problems,
>> then please report them to the list / tracker.
>
>>? Ulf> Maybe we could put some focus on these points.
>>? >> 
>>? >> Sure, but please be a bit more specific.
>
>I think we should create a range of rootfs definitions
>with reasonable combinations for testing purposes.
>
>* Busybox only.
>* A communications oriented (no graphics)
>? Maybe an Internet Radio /Audio player
>* DirectFB with a simple touch interface
>* X-Windows
>
>This should be tested on multiple distributions
>(Ubuntu/Fedora/OpenSuSE etc.).
>
>We then need to define certain tests that needs to be run on the target.
>
>The result should be published as web pages in docs
>
>>? Ulf> I think it is amateurish? to just go about trying to fix issues.
>>? Ulf> We need to establish the structure for how we test,
>>? Ulf> how we publish what we test and how we mark
>>? Ulf> packages with problem so that users do not waste their time.
>> 
>> Heh, I would certainly prefer to spend our energy on actually fixing
>> stuff than arguing about how to show what's broken. Everything broken
>> is a bug, and bugs should get fixed.
>>
>That is because either you do not care about others
>or you do not grip the situation.
>Do you think that if buildroot was a commercial tool
>that people would accept your opinion, or would they
>go to someone more interested in their problems?
>
>I want to spend my energy on making it easier for people 
>without too much knowledge to get an embedded linux system
>running and telling people up front what works and does not work
>is key to get acceptance.
>
>Bugs needs to be fixed, as time permits,
>but if that is the only support provided, then this
>is no tool for anything but hobbyists like yourself.
>
>> Again, please use the bug tracker.
>> 
>> I'm not against doing more structured build tests, and will look into
>> getting buildbot running again with some sensible defconfigs soonish,
>> but that shouldn't stop you or anyone else from reporting (and fixing)
>> bugs.
>>
>It is not enough to report and fix bugs.
>BR
>Ulf Samuelsson

--Frank



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090221/545ef610/attachment.htm>
