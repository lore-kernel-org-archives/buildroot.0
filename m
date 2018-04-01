From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 19:59:13 +0200
Subject: [Buildroot] [PATCH v2 1/5] support/scripts/graph-depends:
 remove global code and most global variables
In-Reply-To: <20180331163543.6278-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 31 Mar 2018 18:35:39 +0200")
References: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
 <20180331163543.6278-2-thomas.petazzoni@bootlin.com>
Message-ID: <87d0zireoe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The graph-depends script had no main() function, and the main code was
 > actually spread between the function definitions, which was a real
 > mess.

 > This commit moves the global code into a main() function, which allows
 > to more easily follow the flow of the script. The argument parsing
 > code is moved into a parse_args() function.

 > Most of the global variables are removed, and are instead passed as
 > argument when appropriate. This has the side-effect that the
 > print_pkg_deps() function takes a lot of argument, but this is
 > considered better than tons of global variables.

 > The global variables that are removed are: max_depth, transitive,
 > mode, root_colour, target_colour, host_colour, outfile, dict_deps,
 > dict_version, stop_list, exclude_list, arrow_dir.

 > The root_colour/target_colour/host_colour variables are entirely
 > removed, and instead a single colours array is passed, and it's the
 > function using the colors that actually uses the different entries in
 > the array.

 > The way the print_attrs() function determines if we're display the
 > root node is not is changed. Instead of relying on the package name
 > and the mode (which requires passing the root package name, and the
 > mode), it relies on the depth: when the depth is 0, we're at the root
 > node.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
