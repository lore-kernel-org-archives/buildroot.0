From: Liam Staskawicz <liam@stask.net>
Date: Mon, 18 Jun 2018 10:16:46 -0700
Subject: [Buildroot] customizations to package recipes in BR2_EXTERNAL?
In-Reply-To: <1150144198.1192053.1529322524893.JavaMail.zimbra@datacom.com.br>
References: <4428F9BB-DCBB-42D1-AA6E-EFBE83730FD9@stask.net>
 <1150144198.1192053.1529322524893.JavaMail.zimbra@datacom.com.br>
Message-ID: <27474BF0-E8A6-41D3-8D85-0A50DD2350B7@stask.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Jun 18, 2018, at 4:48 AM, Carlos Santos <casantos@datacom.com.br> wrote:
> 
>> From: "Liam Staskawicz" <liam@stask.net>
>> To: "buildroot" <buildroot@busybox.net>
>> Sent: Sunday, June 17, 2018 6:30:14 PM
>> Subject: [Buildroot] customizations to package recipes in BR2_EXTERNAL?
> 
>> Hello,
>> 
>> I'd like to slightly modify an existing package (nvidia-driver) to target a
>> different version (not the latest version, just the specific version my project
>> is using). The changes are simple - updating the version string, and .hash
>> entries - but it's not clear how best to manage these changes in a BR2_EXTERNAL
>> based workflow, as patches in BR2_GLOBAL_PATCH_DIR get applied after the
>> sources have been downloaded and unpacked.
>> 
>> I'd like to avoid maintaining a clone of the buildroot repo with these changes,
>> if possible. Is there a recommended workflow for this situation?
>> 
>> Thanks,
>> Liam
> 
> Allowing users to customize existing packages in a BR2_EXTERNAL could
> lead to unpredictable results. If you need a custom nvidia-driver then
> copy/edit the original package definition to <my-project>-nvidia-driver
> in your BR2_EXTERNAL. That's quite easy, since no other package depends
> on nvidia-driver.

Thanks. This is not exactly straightforward, as it requires significant renaming of variables in the package to match the new package name, which is a bit brittle.

If there were a mechanism that allowed for a copy of the package in BR2_EXTERNAL to take precedence over a package with the same name in the core buildroot packages directory, that could address some of those issues, but perhaps there are other issues with it that I'm not aware of.

If this is really the best option, I would probably just maintain a clone of the buildroot repo with my changes in it, as that would be simpler (though as I originally mentioned, not desirable).

> 
> A more generic solution would be allowing the user to select the desired
> version by means of a sub-menu. This seems to make sense for a package
> that install pre-compiled binaries, like nvidia-driver does.

If that's workable, that would address my concern.

Thanks,
Liam
