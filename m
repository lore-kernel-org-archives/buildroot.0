From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Dec 2013 15:31:57 +0100
Subject: [Buildroot] [PATCH v4 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <CAAXf6LWmNBvqDv5Nw7z+5VaV0Cx3UuWt6Ybo9LyfwLVuGAOLPg@mail.gmail.com>
References: <1387270827-4379-1-git-send-email-rjbarnet@rockwellcollins.com>	<1387270827-4379-2-git-send-email-rjbarnet@rockwellcollins.com>	<CAAXf6LVu=ZUYZ-O-+WcCcnY2sCs8Nn-OiEwRwNkrjyqwhakE=Q@mail.gmail.com>	<52B04F5E.1010602@mind.be>
 <CAAXf6LWmNBvqDv5Nw7z+5VaV0Cx3UuWt6Ybo9LyfwLVuGAOLPg@mail.gmail.com>
Message-ID: <52B0605D.5000905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/13 14:30, Thomas De Schampheleire wrote:
> On Tue, Dec 17, 2013 at 2:19 PM, Arnout Vandecappelle<arnout@mind.be>  wrote:
> [..]
>>>> >>>
>>>> >>>
>>>> >>>-For a specific version <packageversion> of a specific package
>>>> >>><packagename>,
>>>> >>>-patches are applied as follows.
>>>> >>>+For a specific version +<packageversion>+ of a specific package
>>>> >>>++<packagename>+, patches are applied from +BR2_GLOBAL_PATCH_DIR+ as
>>>> >>>+follows:
>>>> >>>
>>>> >>>-First, the default Buildroot patch set for the package is applied.
>>>> >>>+. For every directory - +<global-patch-dir>+ - that exists in
>>>> >>>+  +BR2_GLOBAL_PATCH_DIR+, a +<package-patch-dir>+ will be determined as
>>>> >>>+  follows:
>>>> >>>++
>>>> >>>+* If the directory
>>>> >>>+  +<global-patch-dir>/<packagename>/<packageversion>/+ exists.
>>>> >>>++
>>>> >>>+* Otherwise, if the directory +<global-patch-dir>/<packagename>+ exists.
>>> >>
>>> >>
>>> >>I find this wording strange:
>>> >>'.... will be determined as follows: if the directory A exists.
>>> >>Otherwise, if the directory B exists.'
>>> >>
>>> >>What about:
>>> >>'.... will be determined as follows: A, if it exists. Otherwise, B, if
>>> >>it exists.'
>> >
>> >
>> >  Actually for me, Ryan's formulation sounds more natural: if ... else if ...
>> >else ....
>
> The order of if/else are both fine for me, but I was more referring to
> something else. The intro sentence says: "The order will be determined
> as follows". When I read this, I expect to get a summary of items (the
> 'order'). However, what follows is a list of conditionals ("if A")
> without 'then' statement.
>
> It's a bit like this to me:
> "On lazy days, I do only two things: if I am hungry, and if I am sleepy."
> while I expect more something like:
> "On lazy days, I do only two things: if I am hungry, I eat, and if I
> am sleepy, I sleep."

  Oh, yes, you're right, I didn't read it carefully. The 'then' is 
missing, and it can indeed be avoided by putting the 'if' behind it.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
