From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 6 Aug 2014 21:54:48 +0200
Subject: [Buildroot] [PATCH RFC for 2014.08] manual: high-level
	restructuring
In-Reply-To: <3dea9add9b6cc9fad680.1407349315@localhost>
References: <3dea9add9b6cc9fad680.1407349315@localhost>
Message-ID: <CAHXCMMK_cgipkNg+ForP_ak55BKHEAMxLiZR6_5PJdhPStrVkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Wed, Aug 6, 2014 at 8:21 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> The structure of the buildroot manual is not always clear. There is a large
> number of chapters, and some chapters seem to overlap. The distinction
> between general usage and developer information is not always clear.
>
> This patch restructures the manual into four large parts:
> - getting started
> - user guide
> - developer guide
> - appendix
>
> Except for the names of these parts, the section names are not yet changed.
> Content-wise there are no changes yet either. This will be handled in
> subsequent patches.
>
> In order to achieve the introduction of a new level 'parts' above
> 'chapters', the section indicators (=, ==, ===, ...) of several sections
> have to be moved one level down. Additionally, the leveloffset indication to
> asciidoc has to be removed. Finally, to maintain more or less the same level
> of detail in the table of contents, the toc.section.depth attribute is
> reduced as well. Note that for some sections, less detail is visible now.
>

Thanks a lot for taking care of this.

[...]

>
> Some notes:
> - It is my goal to get the restructured manual in shape for inclusion
>   into 2014.08. I will need your feedback to achieve this.
>
> - I did not yet rename or restructure the files in docs/manual. I first want
>   to get an approval on the layout. Note that the current organization of
>   contents into files reflects the structure a bit too much IMO, with some
>   files simply including other files but not adding content. This makes it
>   difficult to reorganize.

Yep, this is partly because some sections (i.e. files) grew, then were
splitted in several sub-sections/files...

>   I am considering to flatten the file organization to address this problem.

Go ahead! :-)

>
> - I'm planning subsequent patches to join some sections together, update
>   some section titles, and if needed address the content itself.
>   Additionally, I'm considering to remove the 'Events' section as it is not
>   up-to-date and hard to maintain. The wiki is better suited for such type
>   of information, IMO.

I agree.

>
> - Taking into account the above notes, I'm currently not expecting a deep
>   review, since many things are yet to change. Rather, I simply need your
>   opinion on the direction I'm taking with respect to organization and the
>   proposed structure.
>   Your concerns or requests with respect to subsequent patches are of course
>   also welcome.
>
>
> For easy reviewing, the original table of contents was:
>
> 1. About Buildroot
> 2. Starting up
>     2.1. System requirements
>         2.1.1. Mandatory packages
>         2.1.2. Optional packages
>     2.2. Getting Buildroot
>     2.3. Using Buildroot
> 3. Working with Buildroot
>     3.1. Details on Buildroot configuration
>         3.1.1. Cross-compilation toolchain
>         3.1.2. /dev management
>         3.1.3. init system
>     3.2. make tips
>     3.3. Customization
>         3.3.1. Customizing the generated target filesystem
>         3.3.2. Customizing the BusyBox configuration
>         3.3.3. Customizing the uClibc configuration
>         3.3.4. Customizing the Linux kernel configuration
>         3.3.5. Customizing the toolchain
>     3.4. Storing the configuration
>         3.4.1. Basics for storing the configuration
>         3.4.2. Creating your own board support
>         3.4.3. Step-by-step instructions for storing configuration
>         3.4.4. Customizing packages
>         3.4.5. Keeping customizations outside Buildroot
>     3.5. Daily use
>         3.5.1. Understanding when a full rebuild is necessary
>         3.5.2. Understanding how to rebuild packages
>         3.5.3. Offline builds
>         3.5.4. Building out-of-tree
>         3.5.5. Environment variables
>         3.5.6. Dealing efficiently with filesystem images
>         3.5.7. Graphing the dependencies between packages
>         3.5.8. Graphing the build duration
>     3.6. Integration with Eclipse
>     3.7. Hacking Buildroot
> 4. Frequently Asked Questions & Troubleshooting
>     4.1. The boot hangs after Starting network...
>     4.2. Why is there no compiler on the target?
>     4.3. Why are there no development files on the target?
>     4.4. Why is there no documentation on the target?
>     4.5. Why are some packages not visible in the Buildroot config menu?
>     4.6. Why not use the target directory as a chroot directory?
>     4.7. Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
> 5. Known issues
> 6. Going further in Buildroot's innards
>     6.1. How Buildroot works
>     6.2. Advanced usage
>         6.2.1. Using the generated toolchain outside Buildroot
>         6.2.2. Using gdb in Buildroot
>         6.2.3. Using ccache in Buildroot
>         6.2.4. Location of downloaded packages
>         6.2.5. Package-specific make targets
>         6.2.6. Using Buildroot during development
> 7. Developer Guidelines
>     7.1. Coding style
>         7.1.1. Config.in file
>         7.1.2. The .mk file
>         7.1.3. The documentation
>     7.2. Adding new packages to Buildroot
>         7.2.1. Package directory
>         7.2.2. Config.in file
>         7.2.3. The .mk file
>         7.2.4. The .hash file
>         7.2.5. Infrastructure for packages with specific build systems
>         7.2.6. Infrastructure for autotools-based packages
>         7.2.7. Infrastructure for CMake-based packages
>         7.2.8. Infrastructure for Python packages
>         7.2.9. Infrastructure for LuaRocks-based packages
>         7.2.10. Infrastructure for Perl/CPAN packages
>         7.2.11. Infrastructure for virtual packages
>         7.2.12. Infrastructure for packages using kconfig for configuration
>                 files
>         7.2.13. Hooks available in the various build steps
>         7.2.14. Gettext integration and interaction with packages
>         7.2.15. Tips and tricks
>         7.2.16. Conclusion
>     7.3. Patching a package
>         7.3.1. Providing patches
>         7.3.2. How patches are applied
>         7.3.3. Format and licensing of the package patches
>         7.3.4. Integrating patches found on the Web
>     7.4. Download infrastructure
>     7.5. Debugging Buildroot
> 8. Legal notice and licensing
>     8.1. Complying with open source licenses
>     8.2. License abbreviations
>     8.3. Complying with the Buildroot license
> 9. Beyond Buildroot
>     9.1. Boot the generated images
>         9.1.1. NFS boot
>     9.2. Chroot
> 10. Getting involved
>     10.1. Mailing List
>         10.1.1. Subscribing to the mailing list
>         10.1.2. Searching the List Archives
>     10.2. IRC
>     10.3. Patchwork
>         10.3.1. Applying Patches from Patchwork
>     10.4. Bugtracker
>     10.5. Buildroot wikipage
>     10.6. Events
>         10.6.1. Buildroot Developer Days aside ELC-E 2012 (November 3-4,
> 2012 - Barcelona)
>         10.6.2. Buildroot presentation at LSM 2012 (July 12-14, 2012 -
>                 Geneva)
>         10.6.3. Buildroot Developer Days aside FOSDEM 2012 (February 3, 2012
>                 - Brussels)
> 11. Contributing to Buildroot
>     11.1. Reproducing, analyzing and fixing bugs
>     11.2. Analyzing and fixing autobuild failures
>     11.3. Reviewing and testing patches
>     11.4. Work on items from the TODO list
>     11.5. Submitting patches
>         11.5.1. Cover letter
>         11.5.2. Patch revision changelog
>     11.6. Reporting issues/bugs or getting help
> 12. Appendix
>     12.1. Makedev syntax documentation
>     12.2. Makeuser syntax documentation
>     12.3. List of target packages available in Buildroot
>     12.4. List of virtual packages
>     12.5. List of host utilities available in Buildroot
>     12.6. Deprecated features
>
>
> and this patch converts it into:
>
> I. Getting started
>     1. About Buildroot
>     2. System requirements
>         2.1. Mandatory packages
>         2.2. Optional packages
>     3. Getting Buildroot
>     4. Using Buildroot
> II. User guide
>     5. Details on Buildroot configuration
>         5.1. Cross-compilation toolchain
>         5.2. /dev management
>         5.3. init system
>     6. make tips
>     7. Customization
>         7.1. Customizing the generated target filesystem
>         7.2. Customizing the BusyBox configuration
>         7.3. Customizing the uClibc configuration
>         7.4. Customizing the Linux kernel configuration
>         7.5. Customizing the toolchain
>     8. Storing the configuration
>         8.1. Basics for storing the configuration
>         8.2. Creating your own board support
>         8.3. Step-by-step instructions for storing configuration
>         8.4. Customizing packages
>         8.5. Keeping customizations outside Buildroot
>     9. Daily use
>         9.1. Understanding when a full rebuild is necessary
>         9.2. Understanding how to rebuild packages
>         9.3. Offline builds
>         9.4. Building out-of-tree
>         9.5. Environment variables
>         9.6. Dealing efficiently with filesystem images
>         9.7. Graphing the dependencies between packages
>         9.8. Graphing the build duration
>     10. Integration with Eclipse
>     11. Hacking Buildroot
>     12. Frequently Asked Questions & Troubleshooting
>         12.1. The boot hangs after Starting network...
>         12.2. Why is there no compiler on the target?
>         12.3. Why are there no development files on the target?
>         12.4. Why is there no documentation on the target?
>         12.5. Why are some packages not visible in the Buildroot config
>               menu?
>         12.6. Why not use the target directory as a chroot directory?
>         12.7. Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
>     13. Known issues
>     14. Going further in Buildroot's innards
>         14.1. How Buildroot works
>         14.2. Advanced usage
>     15. Legal notice and licensing
>         15.1. Complying with open source licenses
>         15.2. License abbreviations
>         15.3. Complying with the Buildroot license
>     16. Beyond Buildroot
>         16.1. Boot the generated images
>         16.2. Chroot
> III. Developer guide
>     17. Coding style
>         17.1. Config.in file
>         17.2. The .mk file
>         17.3. The documentation
>     18. Adding new packages to Buildroot
>         18.1. Package directory
>         18.2. Config.in file
>         18.3. The .mk file
>         18.4. The .hash file
>         18.5. Infrastructure for packages with specific build systems
>         18.6. Infrastructure for autotools-based packages
>         18.7. Infrastructure for CMake-based packages
>         18.8. Infrastructure for Python packages
>         18.9. Infrastructure for LuaRocks-based packages
>         18.10. Infrastructure for Perl/CPAN packages
>         18.11. Infrastructure for virtual packages
>         18.12. Infrastructure for packages using kconfig for configuration
>                files
>         18.13. Hooks available in the various build steps
>         18.14. Gettext integration and interaction with packages
>         18.15. Tips and tricks
>         18.16. Conclusion
>     19. Patching a package
>         19.1. Providing patches
>         19.2. How patches are applied
>         19.3. Format and licensing of the package patches
>         19.4. Integrating patches found on the Web
>     20. Download infrastructure
>     21. Debugging Buildroot
>     22. Getting involved
>         22.1. Mailing List
>         22.2. IRC
>         22.3. Patchwork
>         22.4. Bugtracker
>         22.5. Buildroot wikipage
>         22.6. Events
>     23. Contributing to Buildroot
>         23.1. Reproducing, analyzing and fixing bugs
>         23.2. Analyzing and fixing autobuild failures
>         23.3. Reviewing and testing patches
>         23.4. Work on items from the TODO list
>         23.5. Submitting patches
>         23.6. Reporting issues/bugs or getting help
> IV. Appendix
>     24. Makedev syntax documentation
>     25. Makeuser syntax documentation
>     26. List of target packages available in Buildroot
>     27. List of virtual packages
>     28. List of host utilities available in Buildroot
>     29. Deprecated features

This looks good to me. Let's see what others say.

Regards,

-- 
Samuel
