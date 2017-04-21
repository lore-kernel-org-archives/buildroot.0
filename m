From: Christian Stewart <christian@paral.in>
Date: Fri, 21 Apr 2017 16:17:13 -0400
Subject: [Buildroot] docker-engine: project rename to moby
Message-ID: <CA+h8R2p-m7ZpxetdLYU+Gnr7uB2YL7KqU3Z-M0-CpX=mWm=7VA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All:

I haven't had much time to read into this yet, but the Docker project
apparently is re-branding their open source presence to "moby":

  - http://github.com/docker/docker -> https://github.com/moby/moby

They have already re-directed the GitHub repository, but have assured
the community that this will not break existing builds. I think we're
safe in Buildroot for the foreseeable future, although it is
concerning that the developers feel it acceptable to rename a project
this mature with so little warning.

The project is splitting into components, but unfortunately things are
not so clear cut. From what I've read, we now have:

 - docker-ce: Community edition, still named Docker, still maintained
by the same team, recommended for end users.
 - docker-ee: Enterprise edition, closed source (?) presumably with
extra features.
 - moby: Open-source "framework for assembling dozens of components
into custom container-based systems, and a place for all container
enthusiasts to experiment and exchange ideas". It's recommended for
"hackers who want to customize or patch their Docker build"

"Docker the product will be assembled from components that are
packaged by the Moby project." Also, "the Moby project provides a
command-line tool called moby which assembles components. Currently it
assembles bootable OS images, but soon it will also be used by Docker
for assembling Docker out of components, many of which will be
independent projects."

What does this mean for Docker in buildroot? Well, I can't even find a
repository link for "docker-ce" on the website, only links to
"download Docker from the Docker Store," which is really concerning to
say the least. It seems the entire Docker project still exists in the
Moby repo, and they are proceeding in development on the same codebase
there (working on a v17.05.0-ce-rc1 release at the moment). For now, I
don't think we should or can change anything. We may need to re-name
"docker-engine" in the future or add a "moby" package.

I'll keep an eye on how things progress.

~ Christian Stewart
